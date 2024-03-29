import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';
import '../../controller/tab_controller.dart';
import '../../controller/event_contoller.dart';
import '../../controller/agenda_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../controller/conferance_controller.dart';
import '../../../config/constant/color_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetDetailsConferanceController getDetailsConferanceController =
      Get.put(GetDetailsConferanceController());
  final GetAllAgendaController getAllAgendaController =
      Get.put(GetAllAgendaController());
  final GetAllEventsController getAllEventsController =
      Get.put(GetAllEventsController());
  final tabcontroller = Get.put(TabCountController());
  TextEditingController searchController = TextEditingController();
  String alphBateName = "";
  @override
  void initState() {
    var date = DateTime.now();
    getAllAgendaController.selectedDateString(date.toString());
    getAllAgendaController.fetchAllAgenda();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<GetAllConferanceController>(
        init: GetAllConferanceController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kAppBarColor,
              automaticallyImplyLeading: false,
              title: const Text("Conferences",
                  style: TextStyle(color: kBackGroundColor)),
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.notificationPage);
                  },
                  child: Container(
                    decoration:
                        const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(15, 0, 0, 0),
                        blurRadius: 10.0,
                      ),
                    ]),
                    margin: const EdgeInsets.only(right: 14),
                    child: Image.asset(
                      "assets/icons/notification.png",
                      scale: 2.1,
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: ClipOval(
                    child: Material(
                        child: Image.asset(
                      "assets/images/blank_profile.png",
                      width: 30,
                      height: 30,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        "assets/images/blank_profile.png",
                        fit: BoxFit.fill,
                      ),
                      fit: BoxFit.cover,
                    )),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.profilePage);
                  },
                ),
              ],
            ),
            body: Obx(
              () {
                if (controller.isLoading.value) {
                  return const Center(
                      child:
                          CircularProgressIndicator(color: kSelectedIconColor));
                } else {
                  if (controller.conferanceList[0].data != null) {
                    if (controller.conferanceList[0].data!.isEmpty) {
                      return Center(
                        child: SizedBox(
                          width: Get.width - 80,
                          child: const Text(
                            "No Conference",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 15,
                                fontFamily: kCircularStdMedium),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(
                        width: Get.width,
                        height: size.width > 500
                            ? Get.height - 190
                            : Get.height - 225,
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.width > 500 ? 600 : Get.width,
                              height: size.width > 500
                                  ? Get.height - 190
                                  : Get.height - 225,
                              child: Center(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      controller.conferanceList[0].data!.length,
                                  itemBuilder: (context, index) {
                                    var discoverData =
                                        controller.conferanceList[0].data!;

                                    if (discoverData.isNotEmpty) {
                                      var data = discoverData[index];
                                      String dateStartString =
                                          data.startDate.toString();
                                      String dateEndString =
                                          data.endDate.toString();

                                      DateTime myDateStartTime =
                                          DateTime.parse(dateStartString);
                                      DateTime myDateEndTime =
                                          DateTime.parse(dateEndString);

                                      DateTime utcStartTime =
                                          myDateStartTime.toUtc();
                                      DateTime utcEndTime =
                                          myDateEndTime.toUtc();

                                      String startTime =
                                          DateFormat('MMM d, yyyy hh:mm a')
                                              .format(utcStartTime);
                                      String endTime =
                                          DateFormat('MMM d, yyyy hh:mm a')
                                              .format(utcEndTime);
                                      return Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            getDetailsConferanceController
                                                .conferanceIdString(
                                                    data.id.toString());
                                            getAllEventsController
                                                .selectedIdString(
                                                    data.id.toString());
                                            getAllEventsController
                                                .selectedDateString(
                                                    data.startDate.toString());
                                            getAllEventsController
                                                .fetchAllEvents();
                                            Get.toNamed(
                                              Routes.conferenceDetailsPage,
                                              arguments: {
                                                'isConferenceActive': false
                                              },
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 7),
                                                child: Card(
                                                  elevation: 6,
                                                  shadowColor:
                                                      const Color.fromARGB(
                                                          50, 0, 0, 0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: kCardColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    14.0)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: Get.width,
                                                          height: 180,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10.0),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              data.photo
                                                                  .toString(),
                                                              fit: BoxFit.cover,
                                                              errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                "assets/images/conference_default.jpg",
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              loadingBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Widget
                                                                          child,
                                                                      ImageChunkEvent?
                                                                          loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return child;
                                                                }
                                                                return SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child: Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color:
                                                                          kPrimaryColor,
                                                                      value: loadingProgress.expectedTotalBytes !=
                                                                              null
                                                                          ? loadingProgress.cumulativeBytesLoaded /
                                                                              loadingProgress.expectedTotalBytes!
                                                                          : null,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                data.name
                                                                    .toString(),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize:
                                                                      17.0,
                                                                  fontFamily:
                                                                      kCircularStdMedium,
                                                                  color:
                                                                      kPrimaryColor,
                                                                ),
                                                              ),
                                                              Text(
                                                                "$startTime - $endTime",
                                                                style: const TextStyle(
                                                                    color:
                                                                        kTextSecondaryColor,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        kWorkSans),
                                                              ),
                                                              const SizedBox(
                                                                  height: 10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  data.venue ==
                                                                          ""
                                                                      ? Container()
                                                                      : Row(
                                                                          children: [
                                                                            const Icon(
                                                                              Icons.location_on_outlined,
                                                                              color: kPrimaryColor,
                                                                              size: 18,
                                                                            ),
                                                                            Text(
                                                                              data.venue.toString(),
                                                                              style: const TextStyle(color: kPrimaryColor, fontSize: 14, fontFamily: kCircularStdNormal),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            20.0),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          "+${data.eventCount} Sessions",
                                                                          style: const TextStyle(
                                                                              color: kPrimaryColor,
                                                                              fontSize: 13,
                                                                              fontFamily: kCircularStdBook),
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                10),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      getDetailsConferanceController
                                                                          .conferanceIdString(data
                                                                              .id
                                                                              .toString());
                                                                      getAllEventsController
                                                                          .selectedIdString(data
                                                                              .id
                                                                              .toString());
                                                                      getAllEventsController.selectedDateString(data
                                                                          .startDate
                                                                          .toString());
                                                                      getAllEventsController
                                                                          .fetchAllEvents();
                                                                      Get.toNamed(
                                                                        Routes
                                                                            .conferenceDetailsPage,
                                                                        arguments: {
                                                                          'isConferenceActive':
                                                                              true
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        const Padding(
                                                                      padding: EdgeInsets.only(
                                                                          right:
                                                                              10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            "Sponsors",
                                                                            style: TextStyle(
                                                                                color: kPrimaryColor,
                                                                                fontSize: 13,
                                                                                fontFamily: kCircularStdBook),
                                                                          ),
                                                                          SizedBox(
                                                                              width: 10),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 3)
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
                                        ),
                                      );
                                    } else {
                                      return const Center(
                                        child: Text(
                                          "No Conference",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 15,
                                              fontFamily: kCircularStdMedium),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    return const Center(
                      child: Text(
                        "No Conference",
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
        });
  }
}
