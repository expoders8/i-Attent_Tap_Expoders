import 'dart:io';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../services/agenda_service.dart';
import '../../controller/tab_controller.dart';
import '../../controller/agenda_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';

class AgendaDetailsPage extends StatefulWidget {
  const AgendaDetailsPage({super.key});

  @override
  State<AgendaDetailsPage> createState() => _AgendaDetailsPageState();
}

class _AgendaDetailsPageState extends State<AgendaDetailsPage> {
  final GetDetailsAgendaController getDetailsAgendaController =
      Get.put(GetDetailsAgendaController());
  final GetAllAgendaController getAllAgendaController =
      Get.put(GetAllAgendaController());
  AgendaService agendaService = AgendaService();
  final controller = Get.put(TabCountController());

  @override
  void initState() {
    getDetailsAgendaController.fetchAgendaDetail();
    super.initState();
  }

  @override
  void dispose() {
    getDetailsAgendaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        leadingWidth: 48,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Get.back();
            getDetailsAgendaController.agendaIdString("");
          },
        ),
      ),
      body: Obx(() {
        if (getDetailsAgendaController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: kSelectedIconColor,
          ));
        } else {
          var data = getDetailsAgendaController.detailAgendaModel!.data;
          String dateStartString = data!.startDate.toString();
          String dateEndString = data.endDate.toString();

          DateTime myDateStartTime = DateTime.parse(dateStartString);
          DateTime myDateEndTime = DateTime.parse(dateEndString);

          DateTime utcStartTime = myDateStartTime.toUtc();
          DateTime utcEndTime = myDateEndTime.toUtc();

          String startTime = DateFormat('MMM d, yyyy').format(utcStartTime);
          String endTime = DateFormat('MMM d, yyyy').format(utcEndTime);
          String venue =
              data.venue == "" ? "Lavaska Center" : data.venue.toString();
          String decription =
              data.description == "" ? "N/A" : data.description.toString();
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width - 70,
                        child: Text(
                          data.title.toString(),
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontFamily: kCircularStdMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                builddetailsWidget(
                    Icons.timer_outlined, "$startTime - $endTime", ""),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Card(
                    elevation: 6,
                    shadowColor: const Color.fromARGB(50, 0, 0, 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    const Icon(Icons.location_on_outlined,
                                        size: 30, color: Color(0xFF184990)),
                                    const SizedBox(height: 10),
                                    Text(
                                      textAlign: TextAlign.center,
                                      venue,
                                      style: const TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 12,
                                        fontFamily: kCircularStdMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.meeting_room_outlined,
                                      size: 30,
                                      color: Color(0xFF184990),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "3 Room",
                                      style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 12,
                                        fontFamily: kCircularStdMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Get.toNamed(Routes.galleryScreen);
                                },
                                child: SizedBox(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/icons/upload.png",
                                        scale: 1.2,
                                        color: const Color(0xFF184990),
                                      ),
                                      const SizedBox(height: 13),
                                      const Text(
                                        "Attachments",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: kSecondaryPrimaryColor,
                                          fontSize: 12,
                                          fontFamily: kCircularStdMedium,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(17, 7, 0, 7),
                  child: const Text(
                    "Speaker",
                    style: TextStyle(
                      color: kTitleColor,
                      fontSize: 17,
                      fontFamily: kCircularStdBold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Card(
                    elevation: 6,
                    shadowColor: const Color.fromARGB(50, 0, 0, 0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: ClipOval(
                                child: Material(
                              color: kTransparentColor,
                              child: Image.asset(
                                "assets/images/blank_profile.png",
                                scale: 1,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  "assets/images/blank_profile.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Darshan Patel",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 17)),
                              Text("dashu.tec@gmail.com",
                                  style: TextStyle(
                                      color: kTitleColor,
                                      fontFamily: kCircularStdMedium)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(17, 7, 0, 7),
                  child: const Text(
                    "About this event",
                    style: TextStyle(
                      color: kTitleColor,
                      fontSize: 17,
                      fontFamily: kCircularStdBold,
                    ),
                  ),
                ),
                builddetailsWidget(
                    Icons.description_outlined, decription, "Description"),
                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
                SizedBox(height: Get.height / 3.7),
                // Container(
                //   padding: const EdgeInsets.fromLTRB(17, 5, 0, 8),
                //   child: const Text(
                //     "Registered Attendees",
                //     style: TextStyle(
                //       color: kTitleColor,
                //       fontSize: 17,
                //       fontFamily: kCircularStdBold,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: Get.height / 3.7,
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 13, right: 13),
                //     child: data.attendees!.isNotEmpty
                //         ? ListView.builder(
                //             physics: const BouncingScrollPhysics(),
                //             itemCount: data.attendees!.length,
                //             itemBuilder: (context, index) {
                //               var attendee = data.attendees![index];
                //               String fullfirstName =
                //                   attendee.firstName.toString();
                //               String fullLastName =
                //                   attendee.lastName.toString();
                //               String firstLatter =
                //                   fullfirstName.substring(0, 1);
                //               String lastLatter = fullLastName.substring(0, 1);
                //               String initials = (firstLatter) + (lastLatter);
                //               return GestureDetector(
                //                 onTap: () {
                //                   Navigator.of(context).push(
                //                     MaterialPageRoute(
                //                       builder: (context) =>
                //                           RegisterAttendeesPage(
                //                         attendeesImage:
                //                             attendee.photo.toString(),
                //                         attendeesName:
                //                             attendee.firstName.toString(),
                //                         attendeesEmail:
                //                             attendee.emailAddress.toString(),
                //                       ),
                //                     ),
                //                   );
                //                 },
                //                 child: Card(
                //                   elevation: 7,
                //                   shadowColor:
                //                       const Color.fromARGB(50, 0, 0, 0),
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                         color: kCardColor,
                //                         borderRadius:
                //                             BorderRadius.circular(15)),
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(10),
                //                       child: Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Row(
                //                             children: [
                //                               Container(
                //                                 decoration: BoxDecoration(
                //                                     color:
                //                                         const Color(0xFFE5E7E8),
                //                                     borderRadius:
                //                                         BorderRadius.circular(
                //                                             25)),
                //                                 height: 35,
                //                                 width: 35,
                //                                 child: Center(
                //                                   child: Text(
                //                                     initials.toString(),
                //                                     style: const TextStyle(
                //                                         color: Color.fromARGB(
                //                                             255, 109, 110, 110),
                //                                         fontSize: 14,
                //                                         fontFamily:
                //                                             kCircularStdNormal),
                //                                   ),
                //                                 ),
                //                               ),
                //                               const SizedBox(width: 10),
                //                               Column(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: [
                //                                   Text(
                //                                     attendee.firstName
                //                                         .toString(),
                //                                     style: const TextStyle(
                //                                         color: kPrimaryColor,
                //                                         fontSize: 15,
                //                                         fontFamily:
                //                                             kCircularStdNormal),
                //                                   ),
                //                                   const SizedBox(height: 3),
                //                                   Text(
                //                                     attendee.emailAddress
                //                                         .toString(),
                //                                     style: const TextStyle(
                //                                         color: kGreyColor,
                //                                         fontSize: 12,
                //                                         fontFamily:
                //                                             kCircularStdNormal),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ],
                //                           ),
                //                           Padding(
                //                               padding: const EdgeInsets.only(
                //                                   right: 3.0),
                //                               child: IconButton(
                //                                 onPressed: () {
                //                                   Get.back();
                //                                   controller.changeTabIndex(3);
                //                                 },
                //                                 icon: const Icon(
                //                                   Icons.message_outlined,
                //                                   color: kPrimaryColor,
                //                                   size: 22,
                //                                 ),
                //                               ))
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               );
                //             },
                //           )
                //         : Center(
                //             child: SizedBox(
                //               width: Get.width - 80,
                //               child: const Text(
                //                 "No Attendees",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                     color: kPrimaryColor,
                //                     fontSize: 15,
                //                     fontFamily: kCircularStdMedium),
                //               ),
                //             ),
                //           ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: SizedBox(
                    width: Get.width,
                    height: 40,
                    child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        color: kButtonColor,
                        child: const Text(
                          "Remove from My Agenda", // Remove from My Agenda
                          style: TextStyle(
                              letterSpacing: 0.8,
                              color: kWhiteColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 15),
                        ),
                        onPressed: () {
                          LoaderX.show(context, 60.0, 60.0);
                          agendaService
                              .deleteAgenda(data.id.toString())
                              .then((value) => {
                                    if (value['success'])
                                      {
                                        Get.back(),
                                        LoaderX.hide(),
                                        getAllAgendaController.fetchAllAgenda()
                                      }
                                  });
                        }),
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }

  // addMyAgendaDialog(context) async {
  //   return showModalBottomSheet<dynamic>(
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(40.0),
  //         topRight: Radius.circular(40.0),
  //       ),
  //     ),
  //     isScrollControlled: true,
  //     backgroundColor: kWhiteColor,
  //     context: context,
  //     builder: (context) {
  //       return Wrap(
  //         children: [
  //           const Center(
  //             child: ImageIcon(
  //               AssetImage("assets/icons/line.png"),
  //               size: 30,
  //               color: Color(0XffBFC5CC),
  //             ),
  //           ),
  //           Theme(
  //               data: ThemeData(
  //                 splashColor: Colors.transparent,
  //                 highlightColor: Colors.transparent,
  //               ),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   const Padding(
  //                     padding: EdgeInsets.symmetric(
  //                         vertical: 10.0, horizontal: 12.0),
  //                     child: Text(
  //                       "Session addes to My agenda. Do you also want to add reminder to phone",
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                           color: kTitleColor,
  //                           fontFamily: kCircularStdBold,
  //                           fontSize: 15),
  //                     ),
  //                   ),
  //                   const Divider(
  //                     thickness: 0.8,
  //                     color: kDividerColor,
  //                   ),
  //                   buildRemindersTime("Remind me 10 min before"),
  //                   buildRemindersTime("Remind me 20 min before"),
  //                   buildRemindersTime("Remind me 30 min before"),
  //                   buildRemindersTime("No reminder"),
  //                 ],
  //               )),
  //         ],
  //       );
  //     },
  //   );
  // }

  buildRemindersTime(String time) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              time,
              style: const TextStyle(
                  color: kPrimaryColor, fontFamily: kCircularStdNormal),
            ),
          ),
          const Divider(
            thickness: 0.8,
            color: kDividerColor,
          ),
        ],
      ),
    );
  }

  builddetailsWidget(IconData icon, String value, String text) {
    return Padding(
      padding: text == "Description"
          ? const EdgeInsets.only(left: 15, top: 11, bottom: 10, right: 10)
          : const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: kTitleColor,
            size: 22,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: Get.width - 70,
            child: Text(
              value,
              style: const TextStyle(
                color: kSecondaryPrimaryColor,
                fontSize: 15,
                fontFamily: kCircularStdMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kBackGroundColor,
      expandedHeight: Platform.isAndroid ? 172 : 145,
      floating: false,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Scaffold(
            appBar: AppBar(toolbarHeight: 0),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                builddetailsWidget(Icons.calendar_month_outlined,
                    "Dec 27, 2023 09:30 AM - Dec 28, 2023 10:00 PM", ""),
                // builddetailsWidget(Icons.timer_outlined, "09:30 - 10:00 AM", ""),
                builddetailsWidget(
                    Icons.location_on_outlined, "Lavaska Center", ""),
                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
                // Container(
                //   padding: const EdgeInsets.fromLTRB(17, 3, 0, 5),
                //   child: const Text(
                //     "About",
                //     style: TextStyle(
                //       color: kTitleColor,
                //       fontSize: 17,
                //       fontFamily: kCircularStdBold,
                //     ),
                //   ),
                // ),
                builddetailsWidget(
                    Icons.description, "Lorem ipsum", "Description"),
              ],
            ),
          ),
        );
      }),
    );
  }

  // SliverAppBar createSilverAppBar2(context) {
  //   return const SliverAppBar(
  //     titleSpacing: 0,
  //     scrolledUnderElevation: 3,
  //     backgroundColor: kBackGroundColor,
  //     automaticallyImplyLeading: false,
  //     toolbarHeight: 100,
  //     pinned: true,
  //     title: SizedBox(height: 105, child: Text("tetet")),
  //   );
  // }
}
