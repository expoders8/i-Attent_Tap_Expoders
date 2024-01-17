import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFC6F6DD), Color(0xFF98BEFB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.repeated),
        ),
        child: const Center(
          child: Text(
            "TAP",
            style: TextStyle(
                color: Color(0xFF0057CB),
                fontSize: 45,
                // fontFamily: kRoboto,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
