import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../components/chat_screen.dart';
import '../../../services/database_service.dart';
import '../../../models/firebase_user_model.dart';
import '../../../../config/constant/color_constant.dart';

class MessageBody extends StatefulWidget {
  final String? searchQueryText;
  const MessageBody({Key? key, this.searchQueryText = ""}) : super(key: key);

  @override
  State<MessageBody> createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: StreamBuilder<List<FirebaseUser>>(
        stream: DBServices().getDiscussionUser(
            widget.searchQueryText != '' ? widget.searchQueryText! : ''),
        builder: (_, s) {
          if (s.hasData) {
            if (widget.searchQueryText == "") {
              final users = s.data;

              List filteredUsers = users!
                  .where((x) => x.lastMessage != null && x.lastMessage != "")
                  .toList();
              return users.isEmpty
                  ? const Center(
                      child: Text("No User to message"),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (ctx, i) {
                          filteredUsers.sort(
                            (a, b) {
                              var adate = a.lastMessageTime;
                              var bdate = b.lastMessageTime;
                              return -adate!.compareTo(bdate!);
                            },
                          );
                          final user = filteredUsers[i];
                          var date = user.lastMessageTime!.toDate().toLocal();
                          var convertedTime = DateFormat("h:mma").format(date);
                          String time = convertedTime
                              .replaceAll("AM", "am")
                              .replaceAll("PM", "pm");
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(user: user),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                              child: SizedBox(
                                height: 80,
                                child: Card(
                                  color: kWhiteColor,
                                  elevation: 2,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: kBackGroundColor,
                                        child: ClipOval(
                                          child: Material(
                                            child: user.image! != ""
                                                ? Image.network(
                                                    user.image!,
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                    loadingBuilder: (BuildContext
                                                            context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) {
                                                        return child;
                                                      }
                                                      return SizedBox(
                                                        width: 35,
                                                        height: 35,
                                                        child: Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color:
                                                                kPrimaryColor,
                                                            value: loadingProgress
                                                                        .expectedTotalBytes !=
                                                                    null
                                                                ? loadingProgress
                                                                        .cumulativeBytesLoaded /
                                                                    loadingProgress
                                                                        .expectedTotalBytes!
                                                                : null,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  )
                                                : Image.asset(
                                                    "assets/images/blank_profile.png",
                                                    width: 33,
                                                    height: 33,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              user.name!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize:
                                                      user.lastMessage! == ""
                                                          ? 18
                                                          : 15,
                                                  color: kPrimaryColor),
                                            ),
                                            user.lastMessage! != ""
                                                ? const SizedBox(
                                                    height: 5,
                                                  )
                                                : Container(),
                                            user.lastMessage! != ""
                                                ? Text(
                                                    user.lastMessage!,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            kTextSecondaryColor),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              time,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  color: kTextSecondaryColor),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            } else {
              final users = s.data;

              return users!.isEmpty
                  ? const Center(
                      child: Text("No User to message"),
                    )
                  : ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (ctx, i) {
                        users.sort(
                          (a, b) {
                            var adate = a.lastMessageTime;
                            var bdate = b.lastMessageTime;
                            return -adate!.compareTo(bdate!);
                          },
                        );
                        final user = users[i];
                        var date = user.lastMessageTime!.toDate().toLocal();
                        var convertedTime = DateFormat("h:mma").format(date);
                        String time = convertedTime
                            .replaceAll("AM", "am")
                            .replaceAll("PM", "pm");
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(user: user),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 2),
                            child: SizedBox(
                              height: 80,
                              child: Card(
                                color: kWhiteColor,
                                elevation: 2,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: kBackGroundColor,
                                      child: ClipOval(
                                        child: Material(
                                          child: user.image! != ""
                                              ? Image.network(
                                                  user.image!,
                                                  width: 40,
                                                  height: 40,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return SizedBox(
                                                      width: 35,
                                                      height: 35,
                                                      child: Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: kPrimaryColor,
                                                          value: loadingProgress
                                                                      .expectedTotalBytes !=
                                                                  null
                                                              ? loadingProgress
                                                                      .cumulativeBytesLoaded /
                                                                  loadingProgress
                                                                      .expectedTotalBytes!
                                                              : null,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )
                                              : Image.asset(
                                                  "assets/images/blank_profile.png",
                                                  width: 33,
                                                  height: 33,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            user.name!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize:
                                                    user.lastMessage! == ""
                                                        ? 18
                                                        : 15,
                                                color: kPrimaryColor),
                                          ),
                                          user.lastMessage! != ""
                                              ? const SizedBox(
                                                  height: 5,
                                                )
                                              : Container(),
                                          user.lastMessage! != ""
                                              ? Text(
                                                  user.lastMessage!,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      color:
                                                          kTextSecondaryColor),
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            time,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontSize: 11,
                                                color: kTextSecondaryColor),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
