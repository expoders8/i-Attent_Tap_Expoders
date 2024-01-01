import 'package:flutter/material.dart';

import '../../../config/constant/color_constant.dart';

class Bt3Page extends StatefulWidget {
  const Bt3Page({super.key});

  @override
  State<Bt3Page> createState() => _Bt3PageState();
}

class _Bt3PageState extends State<Bt3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        title: const Text("Message"),
      ),
    );
  }
}
