// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../controller/tab_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class RegisterAttendeesPage extends StatefulWidget {
  const RegisterAttendeesPage({super.key});

  @override
  State<RegisterAttendeesPage> createState() => _MembersDetailsPageState();
}

class _MembersDetailsPageState extends State<RegisterAttendeesPage> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DottedBorder(
                  strokeWidth: 0.75,
                  borderType: BorderType.Circle,
                  radius: const Radius.circular(30),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: ClipOval(
                        child: Material(
                      color: kTransparentColor,
                      child: Image.asset(
                        "assets/images/blank_profile.png",
                        scale: 1,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          "assets/images/blank_profile.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    )),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Get.width / 2.27,
                            padding: const EdgeInsets.only(left: 5),
                            child: const Text(
                              "Jone Brams",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 18,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: kTitleColor,
                                size: 22,
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: Get.width - 190,
                                child: const Text(
                                  "Lavaska Center",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: kSecondaryPrimaryColor,
                                    fontSize: 15,
                                    fontFamily: kCircularStdMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 0.8,
              color: kDividerColor,
            ),
            Container(
              padding: const EdgeInsets.only(top: 6),
              child: const Text(
                "About",
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
            SizedBox(height: Get.height / 2.4),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: SizedBox(
                width: Get.width,
                height: 40,
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    color: kSelectedIconColor,
                    child: const Text(
                      "Send Message",
                      style: TextStyle(
                          letterSpacing: 0.8,
                          color: kWhiteColor,
                          fontFamily: kCircularStdNormal,
                          fontSize: 15),
                    ),
                    onPressed: () {
                      Get.back();
                      Get.back();
                      controller.changeTabIndex(3);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  builddetailsWidget(IconData icon, String value, String text) {
    return Padding(
      padding: text == "Description"
          ? const EdgeInsets.only(left: 2, top: 11, bottom: 28)
          : const EdgeInsets.symmetric(vertical: 10),
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
