import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/color_constant.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leadingWidth: 60,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kBackGroundColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "About",
          style: TextStyle(color: kBackGroundColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            const Text(
              "i-Attend TAP :  No More Pen and Paper Sign-in Sheets!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "i-Attend TAP is designed to be your hero in accurately capturing Attendance and Registration for Events, Classes, Continuing Education, Training, Conferences, Workshops and  other Meets! This application supports RFID, Barcode and Name Look-up to authenticate your attendees.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text:
                        "i-Attend TAP works in conjunction with i-Attend Cloud.",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Created with love by TNETIC, Inc., a Chicago company."),
          ],
        ),
      ),
    );
  }
}
