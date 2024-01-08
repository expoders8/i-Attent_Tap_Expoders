import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:speech_to_text/speech_to_text.dart' as stts;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

import '../../../../config/constant/font_constant.dart';
import '../../../models/message_model.dart';
import '../components/message_component.dart';
import '../../../services/database_service.dart';
import '../../../models/firebase_user_model.dart';
import '../../../services/firebase_auth_service.dart';
import '../../../../config/constant/color_constant.dart';

class ChatScreen extends StatefulWidget {
  final FirebaseUser? user;
  const ChatScreen({Key? key, this.user}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String text = "";
  String lastDate = "";
  bool show = false;
  bool isSame = false;
  bool sendButton = false;
  bool islisteing = false;
  var speechToText = stts.SpeechToText();
  FocusNode focusNode = FocusNode();
  var msgController = TextEditingController();
  final ScrollController _controller = ScrollController();
  final TextEditingController emojicontroller = TextEditingController();

  sendMessageOnClick() async {
    var msg = Message(
      content: msgController.text,
      createAt: Timestamp.now(),
      reciverUID: widget.user!.uid,
      senderUID: FirebaseAuthServices().user?.uid,
    );
    msgController.clear();
    emojicontroller.clear();
    if (_controller.hasClients) {
      _controller.offset >= 220 ? _scrollDown() : null;
    }
    await DBServices().sendMessage(msg);
    setState(() {
      sendButton = false;
    });
  }

  void _scrollDown() {
    _controller.animateTo(
      0.0,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 300),
    );
  }

  bool isAllSpaces(String input) {
    String output = input.replaceAll(' ', '');
    if (output.isNotEmpty) {
      setState(() {
        sendButton = true;
      });
    } else {
      setState(() {
        sendButton = false;
      });
    }
    return output == '';
  }

  void listen() async {
    if (!islisteing) {
      bool available = await speechToText.initialize();
      if (available) {
        setState(() {
          islisteing = true;
        });
        speechToText.listen(
          onResult: (result) => setState(
            () {
              text = result.recognizedWords;
              msgController.text = text;
              if (text != "") {
                setState(() {
                  sendButton = true;
                  islisteing = false;
                });
              }
            },
          ),
        );
      }
    } else {
      setState(() {
        islisteing = false;
      });
      speechToText.stop();
    }
  }

  _onBackspacePressed() {
    emojicontroller
      ..text = emojicontroller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: emojicontroller.text.length));
    msgController
      ..text = msgController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: msgController.text.length));
  }

  @override
  void initState() {
    speechToText = stts.SpeechToText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          setState(() {
            show = false;
          });
        });
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: kWhiteColor,
          leadingWidth: 60,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Image(
                  image: AssetImage("assets/icons/back_icon.png"),
                  width: 20,
                ),
                onPressed: () => Navigator.of(context).pop(),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: kTextSecondaryColor,
                size: 28,
              ),
              onPressed: optionTypeBottomSheet,
            ),
          ],
          title: Column(
            children: [
              Text(
                widget.user!.name!,
                style: const TextStyle(fontSize: 18, color: kPrimaryColor),
              ),
            ],
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: kDividerColor,
              height: 1.0,
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: ListTile()),
            // Expanded(
            //   child: StreamBuilder<List<Message>>(
            //     stream: DBServices().getMessage(widget.user!.uid!),
            //     builder: (context, s1) {
            //       if (s1.hasData) {
            //         return StreamBuilder<List<Message>>(
            //           stream: DBServices().getMessage(widget.user!.uid!, false),
            //           builder: (context, s2) {
            //             if (s2.hasData) {
            //               var messages = [...s1.data!, ...s2.data!];
            //               messages.sort(
            //                   (i, j) => i.createAt!.compareTo(j.createAt!));
            //               messages = messages.reversed.toList();
            //               return messages.isEmpty
            //                   ? const Center(
            //                       child: Text("No Messages"),
            //                     )
            //                   : ListView.builder(
            //                       controller: _controller,
            //                       reverse: true,
            //                       itemCount: messages.length,
            //                       itemBuilder: (context, index) {
            //                         final image = widget.user!.image;
            //                         final msg = messages[index];
            //                         final date = DateFormat('dd-MM-yyyy')
            //                             .format(DateTime.parse(messages[index]
            //                                 .createAt!
            //                                 .toDate()
            //                                 .toString()));
            //                         final nextDate = messages.length - 1 >=
            //                                 index + 1
            //                             ? DateFormat('dd-MM-yyyy').format(
            //                                 DateTime.parse(messages[index + 1]
            //                                     .createAt!
            //                                     .toDate()
            //                                     .toString()))
            //                             : '';

            //                         isSame = date == nextDate ? true : false;
            //                         // if (index != 0) {
            //                         //   //isSame = lastDate == date ? true : false;
            //                         //   isSame = date == nextDate ? true : false;
            //                         // }
            //                         lastDate = date;

            //                         return Container(
            //                           margin: const EdgeInsets.only(bottom: 10),
            //                           child: Column(
            //                             children: [
            //                               const SizedBox(
            //                                 height: 5,
            //                               ),
            //                               !isSame
            //                                   ? Container(
            //                                       padding:
            //                                           const EdgeInsets.all(3),
            //                                       decoration: BoxDecoration(
            //                                           color: kDividerColor,
            //                                           borderRadius:
            //                                               BorderRadius.circular(
            //                                                   15)),
            //                                       child: Text(
            //                                         date,
            //                                         style: const TextStyle(
            //                                             color: kBlack54Color,
            //                                             fontWeight:
            //                                                 FontWeight.w200),
            //                                       ),
            //                                     )
            //                                   : Container(),
            //                               !isSame
            //                                   ? const SizedBox(
            //                                       height: 5,
            //                                     )
            //                                   : Container(),
            //                               MessageComponent(
            //                                 msg: msg,
            //                                 image: image,
            //                               ),
            //                             ],
            //                           ),
            //                         );
            //                       },
            //                     );
            //             } else {
            //               return const Center(
            //                 child: CircularProgressIndicator(
            //                   color: kPrimaryColor,
            //                 ),
            //               );
            //             }
            //           },
            //         );
            //       } else {
            //         return const Center(
            //           child: CircularProgressIndicator(
            //             color: kPrimaryColor,
            //           ),
            //         );
            //       }
            //     },
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PreferredSize(
                  preferredSize: const Size.fromHeight(1.0),
                  child: Container(
                    color: kDividerColor,
                    height: 1.0,
                  ),
                ),
                Container(
                  width: Get.width,
                  height: 50,
                  margin: const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                  child: TextFormField(
                    controller: msgController,
                    focusNode: focusNode,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    minLines: 1,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) {
                      isAllSpaces(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.all(5),
                      prefixIcon: IconButton(
                        icon: const Image(
                          image: AssetImage("assets/icons/attach_file.png"),
                          width: 19,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (builder) => bottomSheet(),
                          );
                        },
                      ),
                      suffixIcon:
                          // IconButton(
                          //   icon: const Image(
                          //     image: AssetImage("assets/icons/emoji.png"),
                          //     width: 22,
                          //   ),
                          //   onPressed: () {
                          //     focusNode.unfocus();
                          //     focusNode.canRequestFocus = false;
                          //     setState(() {
                          //       show = !show;
                          //     });
                          //   },
                          // ),
                          IconButton(
                        icon: sendButton
                            ? const Icon(
                                Icons.send,
                                color: kPrimaryColor,
                              )
                            : AvatarGlow(
                                animate: islisteing,
                                repeat: true,
                                endRadius: 50,
                                glowColor: kTextSecondaryColor,
                                duration: const Duration(milliseconds: 1000),
                                child: const Image(
                                  image:
                                      AssetImage("assets/icons/microphone.png"),
                                  width: 15,
                                ),
                              ),
                        onPressed: () async {
                          // if (sendButton) {
                          //   sendMessageOnClick();
                          // } else {
                          //   listen();
                          // }
                        },
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                show ? emojiSelect() : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget emojiSelect() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    return SizedBox(
      height: 270,
      child: EmojiPicker(
        onEmojiSelected: ((category, emoji) => {
              setState(() {
                msgController.text = msgController.text + emoji.emoji;
                sendButton = true;
              })
            }),
        onBackspacePressed: _onBackspacePressed,
        textEditingController: emojicontroller,
        config: const Config(
          columns: 7,
          verticalSpacing: 0,
          horizontalSpacing: 0,
          gridPadding: EdgeInsets.zero,
          initCategory: Category.RECENT,
          bgColor: Color(0xFFF2F2F2),
          indicatorColor: Colors.blue,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          backspaceColor: Colors.blue,
          skinToneDialogBgColor: Colors.white,
          skinToneIndicatorColor: Colors.grey,
          enableSkinTones: true,
          recentsLimit: 28,
          replaceEmojiOnLimitExceed: false,
          noRecents: Text(
            'No Recents',
            style: TextStyle(fontSize: 20, color: Colors.black26),
            textAlign: TextAlign.center,
          ),
          loadingIndicator: SizedBox.shrink(),
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: CategoryIcons(),
          checkPlatformCompatibility: true,
        ),
      ),
    );
  }

  callTypeBottomSheet() {
    FocusScope.of(context).requestFocus(FocusNode());
    return showModalBottomSheet<dynamic>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: kWhiteColor,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            const Center(
              child: ImageIcon(
                AssetImage("assets/icons/line.png"),
                size: 30,
                color: Color(0XffBFC5CC),
              ),
            ),
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: SizedBox(
                height: 125,
                child: Column(
                  children: [
                    ListTile(
                      title: const Center(
                        child: Text(
                          "General Call",
                          style: TextStyle(
                            fontFamily: kWorkSans,
                            fontSize: 15,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Center(
                        child: Text(
                          "Video Call",
                          style: TextStyle(
                            fontFamily: kWorkSans,
                            fontSize: 15,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  optionTypeBottomSheet() {
    FocusScope.of(context).requestFocus(FocusNode());
    return showModalBottomSheet<dynamic>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: kWhiteColor,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            const Center(
              child: ImageIcon(
                AssetImage("assets/icons/line.png"),
                size: 30,
                color: Color(0XffBFC5CC),
              ),
            ),
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: SizedBox(
                height: 125,
                child: Column(
                  children: [
                    ListTile(
                      title: const Center(
                        child: Text(
                          "Block",
                          style: TextStyle(
                            fontFamily: kWorkSans,
                            fontSize: 15,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Center(
                        child: Text(
                          "Delete Chat",
                          style: TextStyle(
                            fontFamily: kWorkSans,
                            fontSize: 15,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      onTap: () async {
                        Navigator.of(context).pop();
                        // await DBServices().deleteMessages(widget.user!.uid!);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget bottomSheet() {
    FocusScope.of(context).requestFocus(FocusNode());
    return SizedBox(
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
