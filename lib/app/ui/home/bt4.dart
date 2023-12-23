import 'package:flutter/material.dart';

import '../../../config/constant/color_constant.dart';

class Bt4Page extends StatefulWidget {
  const Bt4Page({super.key});

  @override
  State<Bt4Page> createState() => _Bt4PageState();
}

class _Bt4PageState extends State<Bt4Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        title: Text("Text3"),
      ),
    );
  }
}
