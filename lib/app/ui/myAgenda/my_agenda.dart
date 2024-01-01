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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSelectedIconColor,
        leadingWidth: 60,
        automaticallyImplyLeading: false,
        title: const Text(
          "My Agenda",
          style: TextStyle(
              color: kTextTwoSecondaryColor, fontFamily: kCircularStdMedium),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: kDividerColor,
            height: 0.3,
          ),
        ),
      ),
      body:
          // Container(
          //   color: kBackGroundColor,
          //   height: Get.height - 230,
          //   width: Get.width,
          //   child: ,
          // ),
          Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: kSelectedIconColor,
            child: const DateSectionWidget(),
          ),
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
                  flex: 20,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kBackGroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
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
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5.0),
                                      child: Text("09:30 AM"),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 100,
                                      width: Get.width - 93,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFD7D8F2),
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15))),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.0, top: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Coffee with Aim Team",
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontFamily:
                                                      kCircularStdMedium,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "09:30 - 10:00 AM",
                                              style: TextStyle(
                                                  color: kTitleColor,
                                                  fontFamily:
                                                      kCircularStdMedium,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
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
                        SizedBox(
                          width: Get.width - 55,
                          height: 45,
                          child: CupertinoButton(
                            borderRadius: BorderRadius.circular(14),
                            padding: EdgeInsetsDirectional.zero,
                            color: const Color(0xFF4054FA),
                            onPressed: () {
                              Get.toNamed(Routes.createActivity);
                            },
                            child: const Text(
                              '+ Add my own activity to Agenda',
                              style: TextStyle(
                                  color: kTextTwoSecondaryColor,
                                  fontSize: 16,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ),
                        ),
                      ],
                    ),
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
