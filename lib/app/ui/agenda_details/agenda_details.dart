import 'package:confrance_expoders/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.membersDetailsPage);
                  },
                  child: Image.asset(
                    image[i],
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      "assets/images/blank_profile.png",
                      fit: BoxFit.fill,
                    ),
                    scale: 2,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
          SizedBox(height: Get.height / 3.4),
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
                  onPressed: () {}),
            ),
          )
        ],
      ),
    );
  }

  builddetailsWidget(IconData icon, String value, String text) {
    return Padding(
      padding: text == "Description"
          ? const EdgeInsets.only(left: 15, top: 11, bottom: 28, right: 10)
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
