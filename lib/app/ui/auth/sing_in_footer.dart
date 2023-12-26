// ignore_for_file: public_member_api_docs

import 'package:confrance_expoders/config/constant/color_constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: "Developed by ",
            style: TextStyle(color: kPrimaryColor),
            children: [
              TextSpan(
                style: const TextStyle(
                  color: kSelectedIconColor,
                  decoration: TextDecoration.underline,
                ),
                //make link blue and underline
                text: "TNETIC.inc",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    //on tap code here, you can navigate to other page or URL
                  },
              ),

              //more text paragraph, sentences here.
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Copyright ©. All rights reserved.",
          style: TextStyle(color: kPrimaryColor),
        ),
      ],
    );
  }
}
