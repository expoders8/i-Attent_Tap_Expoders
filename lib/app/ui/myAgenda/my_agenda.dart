import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/app_pages.dart';
import '../widgets/data_section.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class MyAgendaPage extends StatefulWidget {
  const MyAgendaPage({super.key});

  @override
  State<MyAgendaPage> createState() => _MyAgendaPageState();
}

class _MyAgendaPageState extends State<MyAgendaPage> {
  String formattedDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
  int tabSelection = 0;
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
    // "assets/images/i-test2.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      // appBar: AppBar(
      //   backgroundColor: kSelectedIconColor,
      //   leadingWidth: 60,
      //   automaticallyImplyLeading: false,
      //   title: const Text(
      //     "My Agenda",
      //     style: TextStyle(
      //         color: kTextTwoSecondaryColor, fontFamily: kCircularStdMedium),
      //   ),
      //   centerTitle: true,
      //   bottom: PreferredSize(
      //     preferredSize: const Size.fromHeight(1.0),
      //     child: Container(
      //       color: kDividerColor,
      //       height: 0.3,
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            padding:
                const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 10),
            color: kSelectedIconColor,
            child: Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kWhiteColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tabSelection = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: tabSelection == 0
                              ? kSelectedIconColor
                              : kWhiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 12),
                      child: Text(
                        "Full Agenda",
                        style: TextStyle(
                            color: tabSelection == 0
                                ? kWhiteColor
                                : kSelectedIconColor,
                            fontSize: 16,
                            fontFamily: kCircularStdNormal),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tabSelection = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: tabSelection == 1
                              ? kSelectedIconColor
                              : kWhiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      child: Text(
                        "My Agenda",
                        style: TextStyle(
                            color: tabSelection == 1
                                ? kWhiteColor
                                : kSelectedIconColor,
                            fontSize: 16,
                            fontFamily: kCircularStdNormal),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                const DateSectionWidget(),
                SafeArea(
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 6,
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      Expanded(
                        flex: 32,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: kBackGroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Container(
                            height: Get.height - 350,
                            width: Get.width,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                              ),
                            ),
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 10.0),
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0,
                                      left: 10.0,
                                      top: 5.0,
                                      bottom: 5.0),
                                  child: Card(
                                    elevation: 7,
                                    shadowColor:
                                        const Color.fromARGB(50, 0, 0, 0),
                                    child: Container(
                                      width: Get.width,
                                      padding: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: kCardColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 110,
                                                decoration: const BoxDecoration(
                                                    color: kBackGroundColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(14),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15))),
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 20),
                                                child: const Column(
                                                  children: [
                                                    Text(
                                                      "09:30 AM",
                                                      style: TextStyle(
                                                          color: kTitleColor,
                                                          fontFamily:
                                                              kCircularStdMedium,
                                                          fontSize: 13.2),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      "09:45 AM",
                                                      style: TextStyle(
                                                          color:
                                                              kTitleSecondColor,
                                                          fontFamily:
                                                              kCircularStdMedium,
                                                          fontSize: 13.2),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 19.8),
                                                  Text(
                                                    "Coffee with Aim Team",
                                                    style: TextStyle(
                                                        color: kPrimaryColor,
                                                        fontFamily:
                                                            kCircularStdBook,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(height: 25),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        color: kPrimaryColor,
                                                        size: 18,
                                                      ),
                                                      SizedBox(width: 3),
                                                      Text(
                                                        "Coral Lounge",
                                                        style: TextStyle(
                                                            color:
                                                                kPrimaryColor,
                                                            fontSize: 13,
                                                            fontFamily:
                                                                kCircularStdMedium),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const SizedBox(height: 5),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      "+2   ",
                                                      style: TextStyle(
                                                          color: kPrimaryColor,
                                                          fontSize: 15,
                                                          fontFamily:
                                                              kCircularStdMedium),
                                                    ),
                                                    for (int i = 0;
                                                        i < image.length;
                                                        i++)
                                                      Align(
                                                        widthFactor: 0.3,
                                                        child: Image.asset(
                                                          image[i],
                                                          errorBuilder: (context,
                                                                  error,
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
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                                // Column(
                                //   children: [
                                //     Container(
                                //       width: Get.width,
                                //       height: 20,
                                //       color: kTitleBorderColor,
                                //       child: const Text(
                                //         "   7:00 AM",
                                //         style: TextStyle(
                                //             color:
                                //                 Color.fromARGB(255, 52, 72, 110)),
                                //       ),
                                //     ),
                                //     Container(
                                //       padding: const EdgeInsets.symmetric(
                                //           horizontal: 10, vertical: 10),
                                //       width: Get.width,
                                //       height: 90,
                                //       color: kBackGroundColor,
                                //       child: const Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Row(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               Column(
                                //                 children: [
                                //                   Text(
                                //                     "7:00 AM",
                                //                     style: TextStyle(
                                //                         color: kCardTextColor,
                                //                         fontSize: 14,
                                //                         fontFamily:
                                //                             kCircularStdMedium),
                                //                   ),
                                //                   Text("8:00 AM",
                                //                       style: TextStyle(
                                //                           color: Color.fromARGB(
                                //                               255, 161, 160, 159),
                                //                           fontSize: 14,
                                //                           fontFamily:
                                //                               kCircularStdMedium)),
                                //                 ],
                                //               ),
                                //               SizedBox(width: 10),
                                //               Column(
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.start,
                                //                 children: [
                                //                   Text(
                                //                       "Solving the Circuit Field",
                                //                       style: TextStyle(
                                //                           color: kCardTextColor,
                                //                           fontSize: 16,
                                //                           fontFamily:
                                //                               kCircularStdBold)),
                                //                   Row(
                                //                     children: [
                                //                       Icon(
                                //                         Icons
                                //                             .location_on_outlined,
                                //                         color: kPrimaryColor,
                                //                         size: 17,
                                //                       ),
                                //                       SizedBox(width: 3),
                                //                       Text(
                                //                         "VIP Room",
                                //                         style: TextStyle(
                                //                             color: kPrimaryColor,
                                //                             fontSize: 13,
                                //                             fontWeight:
                                //                                 FontWeight.bold,
                                //                             fontFamily:
                                //                                 kCircularStdNormal),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                   SizedBox(height: 8),
                                //                   Row(
                                //                     children: [
                                //                       Icon(
                                //                         Icons
                                //                             .person_outline_outlined,
                                //                         color: kPrimaryColor,
                                //                         size: 15,
                                //                       ),
                                //                       Text(
                                //                         "3",
                                //                         style: TextStyle(
                                //                             color: kPrimaryColor,
                                //                             fontSize: 13,
                                //                             fontWeight:
                                //                                 FontWeight.bold,
                                //                             fontFamily:
                                //                                 kCircularStdNormal),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //           Padding(
                                //             padding: EdgeInsets.only(right: 8.0),
                                //             child: Icon(
                                //               Icons.calendar_month_outlined,
                                //               color: kPrimaryColor,
                                //             ),
                                //           )
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
