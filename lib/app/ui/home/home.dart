import 'dart:io';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
    "assets/images/i-test2.png"
  ];
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        automaticallyImplyLeading: false,
        leadingWidth: 60,
        leading: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Color.fromARGB(15, 0, 0, 0),
                blurRadius: 10.0,
              ),
            ]),
            margin: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: CircleAvatar(
                backgroundColor: kBackGroundColor,
                child: ClipOval(
                  child: Material(
                      child: Image.asset(
                    "assets/images/blank_profile.png",
                    width: 33,
                    height: 33,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      "assets/images/blank_profile.png",
                      fit: BoxFit.fill,
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
        actions: <Widget>[
          Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Container(
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(15, 0, 0, 0),
                    blurRadius: 10.0,
                  ),
                ]),
                margin: const EdgeInsets.only(right: 12),
                child: Image.asset(
                  "assets/icons/notification.png",
                  scale: 2.5,
                )),
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            createSilverAppBar1(),
          ];
        },
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.eventDetailsPage);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      elevation: 6,
                      shadowColor: const Color.fromARGB(50, 0, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kCardColor,
                            borderRadius: BorderRadius.circular(14.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Coffee with Aim Team",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: kCircularStdMedium,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  Text(
                                    "$formattedDate 04:30 AM - 07:30 AM",
                                    style: const TextStyle(
                                        color: kTextSecondaryColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: kWorkSans),
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: kPrimaryColor,
                                            size: 18,
                                          ),
                                          Text(
                                            "To Be Announced",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: kCircularStdNormal),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "+5 more",
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 14,
                                                  fontFamily: kCircularStdBold),
                                            ),
                                            const SizedBox(width: 10),
                                            for (int i = 0;
                                                i < image.length;
                                                i++)
                                              Align(
                                                widthFactor: 0.3,
                                                child: Image.asset(
                                                  image[i],
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    "assets/images/blank_profile.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                  scale: 2,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            );
            // GestureDetector(
            //   onTap: () {},
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //     child: SizedBox(
            //       width: Get.width,
            //       height: 150,
            //       child: Card(
            //         shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(16.0),
            //             topRight: Radius.circular(16.0),
            //             bottomRight: Radius.circular(16.0),
            //           ),
            //         ),
            //         color: kCardColor,
            //         elevation: 1,
            //         child: Container(
            //           decoration: const BoxDecoration(
            //             borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(16.0),
            //               topRight: Radius.circular(16.0),
            //               bottomRight: Radius.circular(16.0),
            //             ),
            //             gradient: LinearGradient(
            //                 colors: [
            //                   Color(0x1FC9FFA3),
            //                   Color.fromARGB(255, 135, 130, 211)
            //                 ],
            //                 begin: Alignment.topLeft,
            //                 end: Alignment.bottomRight,
            //                 tileMode: TileMode.repeated),
            //           ),
            //           child: Padding(
            //             padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 const Text(
            //                   "Coffee with Aim Team",
            //                   style: TextStyle(
            //                       color: kCardTextColor,
            //                       fontSize: 18,
            //                       fontFamily: kCircularStdBold),
            //                 ),
            //                 Text(
            //                   "$formattedDate 04:30 AM - 07:30 AM",
            //                   style: const TextStyle(
            //                       color: Color.fromARGB(255, 113, 114, 116),
            //                       fontSize: 13,
            //                       fontWeight: FontWeight.bold,
            //                       fontFamily: kWorkSans),
            //                 ),
            //                 const SizedBox(height: 25),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   children: [
            //                     const Row(
            //                       children: [
            //                         Icon(
            //                           Icons.location_on,
            //                           color: kPrimaryColor,
            //                           size: 17,
            //                         ),
            //                         Text(
            //                           "To Be Announced",
            //                           style: TextStyle(
            //                               color: kPrimaryColor,
            //                               fontSize: 14,
            //                               fontWeight: FontWeight.bold,
            //                               fontFamily: kCircularStdNormal),
            //                         ),
            //                       ],
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(right: 25.0),
            //                       child: Row(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           const Text(
            //                             "+5 more",
            //                             style: TextStyle(
            //                                 color: kPrimaryColor,
            //                                 fontSize: 14,
            //                                 fontFamily: kCircularStdBold),
            //                           ),
            //                           const SizedBox(width: 10),
            //                           for (int i = 0; i < image.length; i++)
            //                             Align(
            //                               widthFactor: 0.3,
            //                               child: Image.asset(
            //                                 image[i],
            //                                 errorBuilder:
            //                                     (context, error, stackTrace) =>
            //                                         Image.asset(
            //                                   "assets/images/blank_profile.png",
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 scale: 2,
            //                                 fit: BoxFit.cover,
            //                               ),
            //                             ),
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // );
          },
        ),
      ),
    );
  }

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kBackGroundColor,
      expandedHeight: Platform.isAndroid ? 50 : 50,
      floating: false,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return const FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 214,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Events",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 23, fontFamily: kWorkSans),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
