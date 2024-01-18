import 'package:confrance_expoders/config/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../../../config/constant/font_constant.dart';

class ImageviewerWidget extends StatefulWidget {
  final String attechmentUrls;
  final String attechmentDescription;
  const ImageviewerWidget({
    super.key,
    required this.attechmentUrls,
    required this.attechmentDescription,
  });

  @override
  State<ImageviewerWidget> createState() => _ImageviewerWidgetState();
}

class _ImageviewerWidgetState extends State<ImageviewerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack87Color,
      body: Container(
          padding: const EdgeInsets.only(top: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 100,
                color: const Color.fromARGB(99, 0, 0, 0),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: kBackGroundColor,
                    )),
              ),
              Expanded(
                child: PhotoView(
                  imageProvider: AssetImage(widget.attechmentUrls),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                  height: 100,
                  width: Get.width,
                  color: const Color.fromARGB(99, 0, 0, 0),
                  child: Text(
                    widget.attechmentDescription.toString(),
                    style: const TextStyle(
                        color: kBackGroundColor,
                        fontSize: 16,
                        fontFamily: kCircularStdMedium),
                  )),
            ],
          )),
    );
  }
}
