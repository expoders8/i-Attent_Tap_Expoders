import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../../config/constant/constant.dart';
import '../../../models/message_model.dart';
import '../../../services/database_service.dart';
import '../../../models/firebase_user_model.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';

class MessageComponent extends StatefulWidget {
  final Message? msg;
  final String? image;
  const MessageComponent({Key? key, this.msg, this.image}) : super(key: key);

  @override
  State<MessageComponent> createState() => _MessageComponentState();
}

class _MessageComponentState extends State<MessageComponent> {
  String userId = "";

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);
    if (getUserData != null) {
      setState(() {
        userId = getUserData['id'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var date = widget.msg!.createAt!.toDate().toLocal();
    var convertedTime = DateFormat("h:mma").format(date);
    String time = convertedTime.replaceAll("AM", "am").replaceAll("PM", "pm");

    return StreamBuilder<List<FirebaseUser>>(
        stream: DBServices().getAppUser(),
        builder: (_, s) {
          if (s.hasData) {
            final user = s.data;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: widget.msg!.senderUID == userId
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                widget.msg!.senderUID == userId
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(
                            bottom: 18, right: 5, left: 5),
                        child: buildImage(widget.image!),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Column(
                    crossAxisAlignment: widget.msg!.senderUID == userId
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: widget.msg!.senderUID == userId
                              ? kButtonColor
                              : kBackGroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12),
                            topRight: const Radius.circular(12),
                            bottomLeft: widget.msg!.senderUID == userId
                                ? const Radius.circular(12)
                                : const Radius.circular(0),
                            bottomRight: widget.msg!.senderUID == userId
                                ? const Radius.circular(0)
                                : const Radius.circular(12),
                          ),
                        ),
                        constraints: BoxConstraints(
                            minHeight: 30, maxWidth: width / 1.4),
                        child: Text(
                          widget.msg!.content!,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: widget.msg!.senderUID == userId
                                  ? kWhiteColor
                                  : kPrimaryColor,
                              fontSize: 16,
                              fontFamily: kCircularStdNormal,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                            color: kTextSecondaryColor, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                widget.msg!.senderUID == userId
                    ? Padding(
                        padding: const EdgeInsets.only(
                            bottom: 18, right: 5, left: 5),
                        child: buildImage(user![0].image!),
                      )
                    : Container()
              ],
            );
          } else {
            return Container();
          }
        });
  }
}

Widget buildImage(String image) {
  return CircleAvatar(
    backgroundColor: kWhiteColor,
    maxRadius: 15,
    child: ClipOval(
      child: Material(
        child: image != ""
            ? Image.network(
                image,
                width: 33,
                height: 33,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                    width: 33,
                    height: 33,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              )
            : Image.asset("assets/images/blank_profile.png", cacheWidth: 35),
      ),
    ),
  );
}
