import 'dart:developer';

import 'package:confrance_expoders/app/ui/widgets/image_viewer.dart';
import 'package:confrance_expoders/app/ui/widgets/pdf_view.dart';
import 'package:confrance_expoders/config/constant/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/color_constant.dart';
import '../../controller/attachments_conroller.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final GetAllAttechmentController getAllAttechmentController =
      Get.put(GetAllAttechmentController());

  @override
  void initState() {
    // getAllAttechmentController.fetchAllAttechments();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: const Text(
          "Attachments",
          style: TextStyle(color: kBackGroundColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: kBackGroundColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(
        () {
          if (getAllAttechmentController.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(color: kSelectedIconColor));
          } else {
            if (getAllAttechmentController.attechmentList[0].data != null) {
              if (getAllAttechmentController.attechmentList[0].data!.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: Get.width - 80,
                    child: const Text(
                      "No Attechments",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                        height: Get.height - 160,
                        child: GridView.builder(
                          itemCount: getAllAttechmentController
                              .attechmentList[0].data!.length,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemBuilder: (context, index) {
                            var discoverData = getAllAttechmentController
                                .attechmentList[0].data!;
                            var data = discoverData[index];
                            int dotIndex = data.attachment!.lastIndexOf('.');
                            var extention =
                                data.attachment!.substring(dotIndex + 1);
                            return GestureDetector(
                              onTap: () {
                                extention == "pdf"
                                    ? Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => PdfViewWidget(
                                            attechmentUrls:
                                                data.attachment.toString(),
                                            attechmentDescription:
                                                data.description.toString(),
                                          ),
                                        ),
                                      )
                                    : Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ImageviewerWidget(
                                            attechmentUrls:
                                                data.attachment.toString(),
                                            attechmentDescription:
                                                data.description.toString(),
                                          ),
                                        ),
                                      );
                              },
                              child: Stack(
                                children: [
                                  SizedBox(
                                      height: 200,
                                      child: extention == "pdf"
                                          ? Image.asset(
                                              'assets/icons/pdf.png',
                                              scale: 8,
                                            )
                                          : Image.network(
                                              data.attachment.toString(),
                                              fit: BoxFit.cover,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return SizedBox(
                                                  width: 35,
                                                  height: 35,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: kPrimaryColor,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  ),
                                                );
                                              },
                                            )),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 6, top: 6, right: 6),
                                      color: const Color.fromARGB(99, 0, 0, 0),
                                      height: 50,
                                      width: 180,
                                      child: Text(
                                        data.description.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: kBackGroundColor,
                                          fontSize: 15,
                                          fontFamily: kCircularStdMedium,
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   padding: const EdgeInsets.only(left: 6, top: 6),
                                    //   height: 50,
                                    //   width: Get.width,
                                    //   color: const Color.fromARGB(99, 0, 0, 0),
                                    //   child: Container(
                                    //     padding: const EdgeInsets.only(left: 6, top: 6),
                                    //     height: 50,
                                    //     width: 50, // Increase the width to allow for longer text
                                    //     child: const Text(
                                    //       "Jones Bremssdfsdfsdfsdfsdfsdfsdf",
                                    //       maxLines: 1,
                                    //       overflow: TextOverflow.ellipsis,
                                    //       style: TextStyle(
                                    //         color: kBackGroundColor,
                                    //         fontSize: 15,
                                    //         fontFamily: kCircularStdMedium,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  )
                                ],
                              ),
                            );
                          },
                        )),
                  ],
                );
              }
            } else {
              return const Center(
                child: Text(
                  "No Attechments",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
