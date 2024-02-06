import 'dart:io';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../view/event_view.dart';
import '../widgets/data_section.dart';
import '../../controller/event_contoller.dart';
import '../../../config/constant/font_constant.dart';
import '../../controller/conferance_controller.dart';
import '../../../config/constant/color_constant.dart';

class ConferenceDetailsPage extends StatefulWidget {
  const ConferenceDetailsPage({super.key});

  @override
  State<ConferenceDetailsPage> createState() => _ConferenceDetailPageState();
}

class _ConferenceDetailPageState extends State<ConferenceDetailsPage> {
  final GetDetailsConferanceController getDetailsConferanceController =
      Get.put(GetDetailsConferanceController());
  final GetAllEventsController getAllEventsController =
      Get.put(GetAllEventsController());
  String selectedDate = "";
  String selectedsession = "Sessions";

  @override
  void initState() {
    getDetailsConferanceController.fetchStoryDetail();
    super.initState();
  }

  @override
  void dispose() {
    getDetailsConferanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Obx(() {
        if (getDetailsConferanceController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(color: kSelectedIconColor));
        } else {
          var data = getDetailsConferanceController.detailModel!.data;
          String dateStartString = data!.startDate.toString();
          String dateEndString = data.endDate.toString();

          DateTime myDateStartTime = DateTime.parse(dateStartString);
          DateTime myDateEndTime = DateTime.parse(dateEndString);

          DateTime utcStartTime = myDateStartTime.toUtc();
          DateTime utcEndTime = myDateEndTime.toUtc();

          String startTime =
              DateFormat('MMM d, yyyy hh:mm a').format(utcStartTime);
          String endTime = DateFormat('MMM d, yyyy hh:mm a').format(utcEndTime);

          String venue = data.venue == "" ? "N/A" : data.venue.toString();
          return Column(
            children: [
              Stack(
                // clipBehavior: Clip.none,
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
                    child: Image.network(
                      data.photo.toString(),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        "assets/images/conference_default.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          getDetailsConferanceController.conferanceId("");
                          var date = DateTime.now();
                          getAllEventsController
                              .selectedDateString(date.toString());
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: kWhiteColor,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //     bottom: -35.0,
                  //     right: 20.0,
                  //     child: Column(
                  //       children: [
                  //         Card(
                  //             elevation: 6,
                  //             child: Container(
                  //               height: 40,
                  //               width: 40,
                  //               child: Image.network(
                  //                 data.companyLogo.toString(),
                  //                 fit: BoxFit.cover,
                  //                 loadingBuilder: (BuildContext context,
                  //                     Widget child,
                  //                     ImageChunkEvent? loadingProgress) {
                  //                   if (loadingProgress == null) {
                  //                     return child;
                  //                   }
                  //                   return SizedBox(
                  //                     width: 33,
                  //                     height: 33,
                  //                     child: Center(
                  //                       child: CircularProgressIndicator(
                  //                         color: kPrimaryColor,
                  //                         value: loadingProgress
                  //                                     .expectedTotalBytes !=
                  //                                 null
                  //                             ? loadingProgress
                  //                                     .cumulativeBytesLoaded /
                  //                                 loadingProgress
                  //                                     .expectedTotalBytes!
                  //                             : null,
                  //                       ),
                  //                     ),
                  //                   );
                  //                 },
                  //               ),
                  //             )),
                  //         Text(
                  //           data.companyName.toString(),
                  //           style: TextStyle(
                  //               fontFamily: kCircularStdMedium, fontSize: 13),
                  //         )
                  //       ],
                  //     )),
                  Positioned(
                    bottom: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                      child: SizedBox(
                        width: 280,
                        child: Text(
                          data.name.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              color: kBackGroundColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
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
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedsession = "Sessions";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: selectedsession == "Sessions"
                                        ? kSelectedIconColor
                                        : kBackGroundColor,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                "Sessions",
                                style: TextStyle(
                                  color: selectedsession == "Sessions"
                                      ? kSelectedIconColor
                                      : kIconColor,
                                  fontSize: 17,
                                  fontFamily: kCircularStdBold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedsession = "Sponsors";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: selectedsession == "Sponsors"
                                        ? kSelectedIconColor
                                        : kBackGroundColor,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                "Sponsors",
                                style: TextStyle(
                                  color: selectedsession == "Sponsors"
                                      ? kSelectedIconColor
                                      : kIconColor,
                                  fontSize: 17,
                                  fontFamily: kCircularStdBold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: selectedsession == "Sessions"
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DateSectionWidget(
                                    callbackDate: (val) {
                                      getAllEventsController
                                          .selectedDateString(val);
                                      getAllEventsController
                                          .selectedIdString(data.id.toString());
                                      getAllEventsController.fetchAllEvents();
                                    },
                                  ),
                                  EventViewPage(
                                      conferanceName: data.name.toString())
                                ],
                              )
                            : data.sponsors!.isNotEmpty
                                ? ListView.builder(
                                    padding: const EdgeInsets.all(10),
                                    scrollDirection: Axis.vertical,
                                    itemCount: data.sponsors!.length,
                                    itemBuilder: (context, index) {
                                      var sponsorsdata = data.sponsors![index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: ClipOval(
                                                child: Image.network(
                                                  sponsorsdata.sponsorLogo
                                                      .toString(),
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    "assets/images/default_logo_sponser.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                  width: 40,
                                                  height: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  sponsorsdata.sponsorName
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontFamily:
                                                          kCircularStdNormal),
                                                ),
                                                SizedBox(
                                                  width: Get.width - 100,
                                                  child: Text(
                                                    sponsorsdata
                                                        .sponsorDescription
                                                        .toString(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color:
                                                            kTextSecondaryColor,
                                                        fontSize: 14.5,
                                                        fontFamily:
                                                            kCircularStdNormal),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : const Center(
                                    child: Text(
                                      "No Sponsors",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 15,
                                          fontFamily: kCircularStdMedium),
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
    );
  }

  builddetailsWidget(IconData icon, String value, String text) {
    return Padding(
      padding: text == "Description"
          ? const EdgeInsets.only(left: 15, top: 11, bottom: 18, right: 10)
          : const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: kTitleColor,
            size: 21,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: Get.width - 70,
            child: Text(
              value,
              style: const TextStyle(
                color: kSecondaryPrimaryColor,
                fontSize: 12.5,
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
              : 100
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
                decription != ""
                    ? builddetailsWidget(
                        Icons.description, decription, "Description")
                    : Container(),
                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
