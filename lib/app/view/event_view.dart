import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';
import '../controller/agenda_controller.dart';
import '../controller/event_contoller.dart';
import '../routes/app_pages.dart';
import '../services/agenda_service.dart';
import '../controller/tab_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';

class EventViewPage extends StatefulWidget {
  const EventViewPage({super.key});

  @override
  State<EventViewPage> createState() => _EventViewPageState();
}

class _EventViewPageState extends State<EventViewPage> {
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
  ];
  String userId = "";
  AgendaService agendaService = AgendaService();
  final controller = Get.put(TabCountController());
  final GetAllEventsController getAllEventsController =
      Get.put(GetAllEventsController());
  final GetAllAgendaController getAllAgendaController =
      Get.put(GetAllAgendaController());
  final GetDetailsEventController getDetailsEventController =
      Get.put(GetDetailsEventController());
  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);
    if (getUserData != null) {
      setState(() {
        userId = getUserData['id'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (getAllEventsController.isLoading.value) {
            return Container(
              color: kBackGroundColor,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (getAllEventsController.eventList[0].data != null) {
              if (getAllEventsController.eventList[0].data!.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: Get.width - 80,
                    child: const Text(
                      "Event not Found",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: getAllEventsController.eventList[0].data!.length,
                  itemBuilder: (context, index) {
                    var discoverData =
                        getAllEventsController.eventList[0].data!;

                    if (discoverData.isNotEmpty) {
                      var data = discoverData[index];

                      String dateStartString = data.startDate.toString();
                      String dateEndString = data.endDate.toString();
                      DateTime myDateStartTime =
                          DateTime.parse(dateStartString);
                      DateTime myDateEndTime = DateTime.parse(dateEndString);

                      String startTime =
                          DateFormat('hh:mm a').format(myDateStartTime);
                      String endTime =
                          DateFormat('hh:mm a').format(myDateEndTime);
                      return Container(
                          padding: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            color: kBackGroundColor,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              getDetailsEventController
                                  .eventIdString(data.eventId.toString());
                              Get.toNamed(Routes.eventDetailsPage);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10.0, left: 10.0, top: 5.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 102,
                                            decoration: const BoxDecoration(
                                                color: kBackGroundColor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(14),
                                                    bottomLeft:
                                                        Radius.circular(15))),
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10, top: 15.7),
                                            child: Column(
                                              children: [
                                                Text(
                                                  startTime.toString(),
                                                  style: const TextStyle(
                                                      color: kTitleColor,
                                                      fontFamily:
                                                          kCircularStdMedium,
                                                      fontSize: 13.2),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  endTime.toString(),
                                                  style: const TextStyle(
                                                      color: kTitleSecondColor,
                                                      fontFamily:
                                                          kCircularStdMedium,
                                                      fontSize: 13.2),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 15.7),
                                              SizedBox(
                                                width: 150,
                                                child: Text(
                                                  data.eventName.toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: kPrimaryColor,
                                                      fontFamily:
                                                          kCircularStdMedium,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              const SizedBox(height: 22),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on_outlined,
                                                    color: kPrimaryColor,
                                                    size: 18,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Text(
                                                    data.venue == ""
                                                        ? "Coral Lounge"
                                                        : data.venue.toString(),
                                                    style: const TextStyle(
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
                                              addMyAgendaDialog(
                                                  context,
                                                  data.eventName,
                                                  data.description == ""
                                                      ? "test"
                                                      : data.description
                                                          .toString(),
                                                  data.venue != ""
                                                      ? data.venue.toString()
                                                      : "test",
                                                  data.startDate,
                                                  data.endDate,
                                                  data.eventId.toString());
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
                                          SizedBox(
                                              height: 40,
                                              width: 70,
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    data.lstAttendees!.length,
                                                itemBuilder: (context, index) {
                                                  var attendeeData =
                                                      data.lstAttendees![index];
                                                  if (index < 2) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          left: index < 1
                                                              ? 28
                                                              : 0),
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 8.0),
                                                            child: Text(
                                                              (data.lstAttendees!
                                                                              .length <
                                                                          2
                                                                      ? ""
                                                                      : data.lstAttendees!
                                                                              .length -
                                                                          2)
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                color:
                                                                    kPrimaryColor,
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    kCircularStdBook,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width: data.lstAttendees!
                                                                          .length <
                                                                      2
                                                                  ? 0
                                                                  : 10),
                                                          Align(
                                                            widthFactor: 0.3,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black12,
                                                                    blurRadius:
                                                                        5.0,
                                                                    spreadRadius:
                                                                        2.0,
                                                                  )
                                                                ],
                                                              ),
                                                              child: SizedBox(
                                                                width: 25,
                                                                height: 25,
                                                                child:
                                                                    CircleAvatar(
                                                                  radius: 80,
                                                                  backgroundColor:
                                                                      kWhiteColor,
                                                                  child:
                                                                      ClipOval(
                                                                    child: Image
                                                                        .network(
                                                                      attendeeData
                                                                          .attendeePhoto
                                                                          .toString(),
                                                                      width: 33,
                                                                      height:
                                                                          33,
                                                                      errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        "assets/images/blank_profile.png",
                                                                        fit: BoxFit
                                                                            .fill,
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      loadingBuilder: (BuildContext context,
                                                                          Widget
                                                                              child,
                                                                          ImageChunkEvent?
                                                                              loadingProgress) {
                                                                        if (loadingProgress ==
                                                                            null) {
                                                                          return child;
                                                                        }
                                                                        return SizedBox(
                                                                          width:
                                                                              33,
                                                                          height:
                                                                              33,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: kPrimaryColor,
                                                                              value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  } else {
                                                    return Container();
                                                  }
                                                },
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                    } else {
                      return const Center(
                        child: Text(
                          "Event not Found",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                              fontFamily: kCircularStdMedium),
                        ),
                      );
                    }
                  },
                );
              }
            } else {
              return const Center(
                child: Text(
                  "Event not Found",
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

  addMyAgendaDialog(context, title, description, location, startDate, endDate,
      eventId) async {
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
              LoaderX.show(context, 60.0, 60.0);
              agendaService
                  .addAgenda(title, description, location, startDate, endDate,
                      eventId, userId)
                  .then((value) => {
                        if (value['data'])
                          {
                            LoaderX.hide(),
                            Get.back(),
                            controller.changeTabIndex(1),
                            getAllAgendaController.fetchAllAgenda(),
                          }
                        else
                          {
                            LoaderX.hide(),
                            SnackbarUtils.showErrorSnackbar(
                                "Failed to Add Agenda", value["message"])
                          }
                      });
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
}
