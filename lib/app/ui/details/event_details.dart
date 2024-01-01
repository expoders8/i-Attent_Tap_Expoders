import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
    "assets/images/i-test2.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            height: 220,
            decoration: const BoxDecoration(
              color: kSelectedIconColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 0),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 35.0, bottom: 20),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kWhiteColor,
                      size: 17,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 18),
                    Container(
                        height: 80,
                        width: 48,
                        decoration: BoxDecoration(
                            color: kBackGroundColor,
                            borderRadius: BorderRadius.circular(30)),
                        // padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Mon",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "29",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 55,
                              height: 26,
                              decoration: const BoxDecoration(
                                  color: kOrangeColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                              child: const Center(
                                child: Text(
                                  "2023",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(width: 15),
                    const SizedBox(
                        width: 170,
                        child: Text(
                          "Coffee with Aim Team",
                          style: TextStyle(
                              color: kBackGroundColor,
                              fontFamily: kCircularStdMedium,
                              fontSize: 20),
                        )),
                  ],
                ),
                const SizedBox(height: 2)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(17, 20, 0, 5),
            child: const Text(
              "Members",
              style: TextStyle(
                color: kTitleColor,
                fontSize: 17,
                fontFamily: kCircularStdBold,
              ),
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < image.length; i++)
                Image.asset(
                  image[i],
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    "assets/images/blank_profile.png",
                    fit: BoxFit.fill,
                  ),
                  scale: 2,
                  fit: BoxFit.cover,
                ),
            ],
          ),
          builddetailsWidget(Icons.timer_outlined, "09:30 - 10:00 AM"),
          builddetailsWidget(
              Icons.calendar_month_outlined, "Monday, 11 December, 2019"),
          builddetailsWidget(Icons.location_on_outlined, "Lavaska Center"),
          const Padding(
            padding: EdgeInsets.only(left: 47.0),
            child: Text(
              "34 East Road Bakery,near CP,New Delhi 67",
              style: TextStyle(
                color: kSecondaryPrimaryColor,
                fontSize: 15,
                fontFamily: kCircularStdBold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          builddetailsWidget(Icons.description,
              "A Discussion on the new app Hobbify. Be ready with your topics"),
          const Divider(
            thickness: 0.8,
            color: kDividerColor,
          ),
        ],
      ),
    );
  }

  builddetailsWidget(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
                fontSize: 16,
                fontFamily: kCircularStdBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
