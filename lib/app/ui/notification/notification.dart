import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        leadingWidth: 60,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text("Notification"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: kDividerColor,
            height: 1.0,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: kBackGroundColor,
                      child: ClipOval(
                        child: Material(
                            child: Image.asset(
                          "assets/images/blank_profile.png",
                          width: 32,
                          height: 32,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            "assets/images/blank_profile.png",
                            fit: BoxFit.fill,
                          ),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2),
                        Text(
                          "Coffee with Aim Team",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: kCircularStdMedium,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                          "Pigs Showing His Strength",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: kCircularStdNormal,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  "4d ago",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: kCircularStdNormal,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
