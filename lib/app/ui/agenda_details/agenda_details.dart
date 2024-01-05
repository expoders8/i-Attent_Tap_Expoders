import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/app_pages.dart';
import '../../controller/tab_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class AgendaDetailsPage extends StatefulWidget {
  const AgendaDetailsPage({super.key});

  @override
  State<AgendaDetailsPage> createState() => _AgendaDetailsPageState();
}

class _AgendaDetailsPageState extends State<AgendaDetailsPage> {
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
    "assets/images/i-test2.png"
  ];
  final controller = Get.put(TabCountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        leadingWidth: 48,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width - 70,
                  child: const Text(
                    "Coffee with Aim Team",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontFamily: kCircularStdMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          builddetailsWidget(
              Icons.timer_outlined, "Dec 17,2023 - Jan 7,2024", ""),
          builddetailsWidget(Icons.location_on_outlined, "Lavaska Center", ""),
          const Divider(
            thickness: 0.8,
            color: kDividerColor,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(17, 7, 0, 10),
            child: const Text(
              "About this event",
              style: TextStyle(
                color: kTitleColor,
                fontSize: 17,
                fontFamily: kCircularStdBold,
              ),
            ),
          ),
          builddetailsWidget(
              Icons.description_outlined, "Lavaska Center", "Description"),
          const Divider(
            thickness: 0.8,
            color: kDividerColor,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(17, 13, 0, 8),
            child: const Text(
              "Registered Attendees",
              style: TextStyle(
                color: kTitleColor,
                fontSize: 17,
                fontFamily: kCircularStdBold,
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 2.6,
            child: Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.registerAttendeesPage);
                    },
                    child: Card(
                      elevation: 7,
                      shadowColor: const Color.fromARGB(50, 0, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kCardColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFE5E7E8),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    height: 35,
                                    width: 35,
                                    child: const Center(
                                      child: Text(
                                        "JB",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 109, 110, 110),
                                            fontSize: 14,
                                            fontFamily: kCircularStdNormal),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jone Brames",
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 15,
                                            fontFamily: kCircularStdNormal),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "jonebrames@gmail.com",
                                        style: TextStyle(
                                            color: kGreyColor,
                                            fontSize: 12,
                                            fontFamily: kCircularStdNormal),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                      controller.changeTabIndex(3);
                                    },
                                    icon: const Icon(
                                      Icons.message_outlined,
                                      color: kPrimaryColor,
                                      size: 22,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Row(
          //   children: [
          //     for (int i = 0; i < image.length; i++)
          //       GestureDetector(
          //         onTap: () {
          //           Get.toNamed(Routes.membersDetailsPage);
          //         },
          //         child: Image.asset(
          //           image[i],
          //           errorBuilder: (context, error, stackTrace) => Image.asset(
          //             "assets/images/blank_profile.png",
          //             fit: BoxFit.fill,
          //           ),
          //           scale: 2,
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //   ],
          // ),
          // SizedBox(height: Get.height / 3.4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: SizedBox(
              width: Get.width,
              height: 40,
              child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  color: kSelectedIconColor,
                  child: const Text(
                    "Add to My Agenda", // Remove from My Agenda
                    style: TextStyle(
                        letterSpacing: 0.8,
                        color: kWhiteColor,
                        fontFamily: kCircularStdNormal,
                        fontSize: 15),
                  ),
                  onPressed: () {
                    Get.back();
                    controller.changeTabIndex(2);
                  }),
            ),
          )
        ],
      ),
    );
  }

  builddetailsWidget(IconData icon, String value, String text) {
    return Padding(
      padding: text == "Description"
          ? const EdgeInsets.only(left: 15, top: 11, bottom: 20, right: 10)
          : const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: kTitleColor,
            size: 22,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: Get.width - 70,
            child: Text(
              value,
              style: const TextStyle(
                color: kSecondaryPrimaryColor,
                fontSize: 15,
                fontFamily: kCircularStdMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
