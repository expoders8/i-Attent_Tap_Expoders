import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../controller/notification_contoller.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final GetAllNotificationController getAllNotificationController =
      Get.put(GetAllNotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
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
      body: Obx(
        () {
          if (getAllNotificationController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (getAllNotificationController.notificationList[0].data != null) {
              if (getAllNotificationController
                  .notificationList[0].data!.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: Get.width - 80,
                    child: const Text(
                      "Notification not Found",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: Get.height - 160,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: getAllNotificationController
                            .notificationList[0].data!.length,
                        itemBuilder: (context, index) {
                          var discoverData = getAllNotificationController
                              .notificationList[0].data!;

                          if (discoverData.isNotEmpty) {
                            var data = discoverData[index];
                            DateTime createdDateTime =
                                DateTime.parse(data.createdOn.toString());

                            Duration difference =
                                DateTime.now().difference(createdDateTime);
                            int differenceDays = difference.inDays;
                            int differenceHours = difference.inHours % 24;
                            int differenceMinutes = difference.inMinutes % 60;
                            String timeAgo = differenceDays >= 1
                                ? "${differenceDays.toString()} d ago"
                                : differenceHours >= 1
                                    ? "${differenceHours.toString()} h ago"
                                    : "${differenceMinutes.toString()} m ago";
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: kBackGroundColor,
                                        child: ClipOval(
                                          child: Material(
                                              child: Image.asset(
                                            "assets/images/blank_profile.png",
                                            width: 32,
                                            height: 32,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              "assets/images/blank_profile.png",
                                              fit: BoxFit.fill,
                                            ),
                                            fit: BoxFit.cover,
                                          )),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 2),
                                          Text(
                                            data.title.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: kCircularStdMedium,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          Text(
                                            data.text.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              fontFamily: kCircularStdNormal,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    timeAgo,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      fontFamily: kCircularStdNormal,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text(
                                "Notification not Found",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                    fontFamily: kCircularStdMedium),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              }
            } else {
              return const Center(
                child: Text(
                  "Notification not Found",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
