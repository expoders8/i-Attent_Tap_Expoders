import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widgets/data_section.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: Get.width,
                height: 190,
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
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: kWhiteColor,
                      size: 17,
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 10,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, bottom: 10),
                  child: SizedBox(
                    width: 250,
                    child: Text(
                      "Coffee with Aim Team",
                      style: TextStyle(
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
                  createSilverAppBar1(),
                ];
              },
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DateSectionWidget(),
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
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 10.0, left: 10.0, top: 5.0, bottom: 5.0),
                            child: Card(
                              elevation: 7,
                              shadowColor: const Color.fromARGB(50, 0, 0, 0),
                              child: Container(
                                width: Get.width,
                                padding: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: kCardColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 110,
                                          decoration: const BoxDecoration(
                                              color: kBackGroundColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(14),
                                                  bottomLeft:
                                                      Radius.circular(15))),
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 20),
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
                                                    color: kTitleSecondColor,
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
                                                  Icons.location_on_outlined,
                                                  color: kPrimaryColor,
                                                  size: 18,
                                                ),
                                                SizedBox(width: 2),
                                                Text(
                                                  "Coral Lounge",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
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
                                          onTap: () {
                                            addMyAgendaDialog(context);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            width: 40,
                                            height: 40,
                                            child: Image.asset(
                                              'assets/icons/calender_plus.png',
                                              color: const Color(0xFF415880),
                                              scale: 6,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
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
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  addMyAgendaDialog(context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: kCardColor,
        title: const Text("Alert !"),
        elevation: 5,
        titleTextStyle: const TextStyle(fontSize: 19, color: kRedColor),
        content: const Text("Are you sure want to Add in My Agenda?"),
        contentPadding: const EdgeInsets.only(left: 25, top: 10),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Get.back();
            },
            child: const Text(
              'Yes',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'No',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
        ],
      ),
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

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kBackGroundColor,
      expandedHeight: Platform.isAndroid ? 210 : 145,
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
                Container(
                  padding: const EdgeInsets.fromLTRB(17, 3, 0, 5),
                  child: const Text(
                    "About",
                    style: TextStyle(
                      color: kTitleColor,
                      fontSize: 17,
                      fontFamily: kCircularStdBold,
                    ),
                  ),
                ),
                builddetailsWidget(
                    Icons.description, "Lavaska Center", "Description"),
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
