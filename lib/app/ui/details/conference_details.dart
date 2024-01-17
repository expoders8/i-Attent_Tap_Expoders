import 'dart:io';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../controller/event_contoller.dart';
import '../../view/event_view.dart';
import '../widgets/data_section.dart';
import '../../../config/constant/font_constant.dart';
import '../../controller/conferance_controller.dart';
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
  final GetAllEventsController getAllEventsController =
      Get.put(GetAllEventsController());
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
                  Positioned(
                    bottom: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 280,
                            child: Text(
                              data.name.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: kBackGroundColor,
                                  fontFamily: kCircularStdNormal,
                                  fontSize: 19),
                            ),
                          ),
                          Image.asset(
                            'assets/icons/gallary.png',
                            scale: 5,
                            color: kBackGroundColor,
                          )
                        ],
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
                          getAllEventsController.selectedDateString(val);
                          getAllEventsController
                              .selectedIdString(data.id.toString());
                          getAllEventsController.fetchAllEvents();
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
                      const EventViewPage()
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
