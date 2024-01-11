import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../controller/conferance_controller.dart';
import '../../routes/app_pages.dart';
import '../home/tab_page.dart';
import '../widgets/data_section.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class ConferenceDetailsPage extends StatefulWidget {
  const ConferenceDetailsPage({super.key});

  @override
  State<ConferenceDetailsPage> createState() => _ConferenceDetailPageState();
}

class _ConferenceDetailPageState extends State<ConferenceDetailsPage> {
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
  ];
  final GetDetailsConferanceController getDetailsConferanceController =
      Get.put(GetDetailsConferanceController());
  String selectedDate = "";

  @override
  void initState() {
    getDetailsConferanceController.fetchStoryDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Obx(() {
        if (getDetailsConferanceController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          var data = getDetailsConferanceController.detailModel!.data;
          String dateStartString = data!.startDate.toString();
          String dateEndString = data.endDate.toString();
          DateTime myDateStartTime = DateTime.parse(dateStartString);
          DateTime myDateEndTime = DateTime.parse(dateEndString);

          String startTime =
              DateFormat('MMM d, yyyy hh:mm a').format(myDateStartTime);
          String endTime =
              DateFormat('MMM d, yyyy hh:mm a').format(myDateEndTime);
          String venue =
              data.venue == "" ? "Lavaska Center" : data.venue.toString();
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 140,
                    foregroundDecoration: const BoxDecoration(
                      color: kWhiteColor,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF121330),
                          Colors.transparent,
                          Colors.transparent,
                          Color(0xFF121330)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0, 0, 1],
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/images.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 10),
                      child: IconButton(
                        onPressed: () {
                          Get.offAll(
                            () => const TabPage(
                              screenDef: "Home",
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: kWhiteColor,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          data.name.toString(),
                          style: const TextStyle(
                              color: kBackGroundColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 19),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxScrolled) {
                    return <Widget>[
                      createSilverAppBar1(startTime, endTime, venue,
                          data.description.toString()),
                    ];
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DateSectionWidget(
                        callbackDate: (val) {
                          setState(() {
                            selectedDate = val;
                          });
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(17, 13, 0, 8),
                        child: const Text(
                          "Sessions",
                          style: TextStyle(
                            color: kTitleColor,
                            fontSize: 17,
                            fontFamily: kCircularStdBold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: Get.width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                            ),
                          ),
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: ListView.builder(
                            padding: const EdgeInsets.only(top: 0),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.eventDetailsPage);
                                },
                                child: Padding(
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
                                                            kCircularStdMedium,
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
                                                      SizedBox(width: 2),
                                                      Text(
                                                        "Coral Lounge",
                                                        style: TextStyle(
                                                            color:
                                                                kPrimaryColor,
                                                            fontSize: 13,
                                                            fontFamily:
                                                                kCircularStdNormal),
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
                                              const SizedBox(height: 10),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  width: 40,
                                                  height: 40,
                                                  child: Image.asset(
                                                    'assets/icons/calender_plus.png',
                                                    color:
                                                        const Color(0xFF415880),
                                                    scale: 6,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 4),
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
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }),

      // bottomNavigationBar: const TabPage(
      //   screenDef: "Details",
      // ),
    );
  }

  builddetailsWidget(IconData icon, String value, String text) {
    return Padding(
      padding: text == "Description"
          ? const EdgeInsets.only(left: 15, top: 11, bottom: 18, right: 10)
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

  SliverAppBar createSilverAppBar1(
      String startDate, String endDate, String venue, String decription) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kBackGroundColor,
      expandedHeight: Platform.isAndroid
          ? decription != ""
              ? 172
              : 120
          : 153,
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
                builddetailsWidget(
                    Icons.calendar_month_outlined, "$startDate - $endDate", ""),
                builddetailsWidget(Icons.location_on_outlined, venue, ""),
                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
                decription != ""
                    ? builddetailsWidget(
                        Icons.description, decription, "Description")
                    : Container()
              ],
            ),
          ),
        );
      }),
    );
  }
}
