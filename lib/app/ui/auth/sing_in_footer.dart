// ignore_for_file: public_member_api_docs

import 'package:confrance_expoders/config/constant/color_constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: "Developed by ",
            style: const TextStyle(color: kPrimaryColor),
            children: [
              TextSpan(
                style: const TextStyle(
                  color: kSelectedIconColor,
                ),
                text: "TNETIC.inc",
                recognizer: TapGestureRecognizer()..onTap = () async {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Copyright ©. All rights reserved.",
          style: TextStyle(color: kPrimaryColor),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       const Text(
        //         "By registering, you agree to the ",
        //         style: TextStyle(
        //             fontSize: 8.8,
        //             color: kPrimaryColor,
        //             fontFamily: kCircularStdBook),
        //       ),
        //       GestureDetector(
        //         onTap: () async {
        //           // var url = "https://opengiving.app/privacy";
        //           // if (await canLaunchUrl(Uri.parse(url))) {
        //           //   await launchUrl(Uri.parse(url));
        //           // } else {
        //           //   throw "Could not launch $url";
        //           // }
        //         },
        //         child: const Text(
        //           "privacy policy",
        //           style: TextStyle(
        //               fontSize: 8.8,
        //               color: kButtonColor,
        //               fontFamily: kCircularStdBook,
        //               decoration: TextDecoration.underline),
        //         ),
        //       ),
        //       const Text(
        //         " and ",
        //         style: TextStyle(
        //             fontSize: 8.8,
        //             color: kPrimaryColor,
        //             fontFamily: kCircularStdBook),
        //       ),
        //       GestureDetector(
        //         onTap: () async {
        //           // var url = "https://opengiving.app/terms";
        //           // if (await canLaunchUrl(Uri.parse(url))) {
        //           //   await launchUrl(Uri.parse(url));
        //           // } else {
        //           //   throw "Could not launch $url";
        //           // }
        //         },
        //         child: const Text(
        //           "terms",
        //           style: TextStyle(
        //               fontSize: 8.8,
        //               color: kButtonColor,
        //               fontFamily: kCircularStdBook,
        //               decoration: TextDecoration.underline),
        //         ),
        //       ),
        //       const Text(
        //         " of service.",
        //         style: TextStyle(
        //             fontSize: 8.8,
        //             color: kPrimaryColor,
        //             fontFamily: kCircularStdBook),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
