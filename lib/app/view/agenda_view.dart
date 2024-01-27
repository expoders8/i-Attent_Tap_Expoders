import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/provider/loader_provider.dart';
import '../controller/agenda_controller.dart';
import '../routes/app_pages.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../services/agenda_service.dart';

class AgendaViewPage extends StatefulWidget {
  const AgendaViewPage({super.key});

  @override
  State<AgendaViewPage> createState() => _AgendaViewPageState();
}

class _AgendaViewPageState extends State<AgendaViewPage> {
  final GetAllAgendaController getAllAgendaController =
      Get.put(GetAllAgendaController());
  final GetDetailsAgendaController getDetailsAgendaController =
      Get.put(GetDetailsAgendaController());
  AgendaService agendaService = AgendaService();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (getAllAgendaController.isLoading.value) {
            return Container(
              color: kBackGroundColor,
              child: const Center(
                child: CircularProgressIndicator(
                  color: kSelectedIconColor,
                ),
              ),
            );
          } else {
            if (getAllAgendaController.agendaList[0].data != null) {
              if (getAllAgendaController.agendaList[0].data!.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: Get.width - 80,
                    child: const Text(
                      "Agenda not Found",
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
                  itemCount: getAllAgendaController.agendaList[0].data!.length,
                  itemBuilder: (context, index) {
                    var discoverData =
                        getAllAgendaController.agendaList[0].data!;

                    if (discoverData.isNotEmpty) {
                      var data = discoverData[index];
                      String dateStartString = data.startDate.toString();
                      String dateEndString = data.endDate.toString();
                      DateTime myDateStartTime =
                          DateTime.parse(dateStartString);
                      DateTime myDateEndTime = DateTime.parse(dateEndString);
                      DateTime utcStartTime = myDateStartTime.toUtc();
                      DateTime utcEndTime = myDateEndTime.toUtc();
                      String startTime =
                          DateFormat('hh:mm a').format(utcStartTime);
                      String endTime = DateFormat('hh:mm a').format(utcEndTime);
                      return Container(
                          padding: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            color: kBackGroundColor,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              getDetailsAgendaController
                                  .agendaIdString(data.id.toString());
                              Get.toNamed(Routes.agendaDetailsPage);
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
                                            height: 90,
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
                                                width: 173,
                                                child: Text(
                                                  data.title.toString(),
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
                                              const SizedBox(height: 18),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on_outlined,
                                                    color: kPrimaryColor,
                                                    size: 18,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Text(
                                                    data.location == ""
                                                        ? "Coral Lounge"
                                                        : data.location
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: kPrimaryColor,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            kCircularStdNormal),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              LoaderX.show(context, 60.0, 60.0);
                                              agendaService
                                                  .deleteAgenda(
                                                      data.id.toString())
                                                  .then((value) => {
                                                        if (value['success'])
                                                          {
                                                            LoaderX.hide(),
                                                            getAllAgendaController
                                                                .fetchAllAgenda()
                                                          }
                                                      });
                                            },
                                            icon: Container(
                                              padding: const EdgeInsets.all(8),
                                              width: 40,
                                              height: 40,
                                              child: Image.asset(
                                                'assets/icons/calendar_minus.png',
                                                color: const Color(0xFF415880),
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     LoaderX.show(context, 60.0, 60.0);
                                          //     agendaService
                                          //         .deleteAgenda(
                                          //             data.id.toString())
                                          //         .then((value) => {
                                          //               if (value['success'])
                                          //                 {
                                          //                   LoaderX.hide(),
                                          //                   getAllAgendaController
                                          //                       .fetchAllAgenda()
                                          //                 }
                                          //             });
                                          //   },
                                          //   child: Container(
                                          //     padding: const EdgeInsets.all(8),
                                          //     width: 40,
                                          //     height: 40,
                                          //     child: Image.asset(
                                          //       'assets/icons/calendar_minus.png',
                                          //       color: const Color(0xFF415880),
                                          //     ),
                                          //   ),
                                          // ),
                                          const SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 1.0),
                                            child: Text(
                                              data.totalAttendeeCount == 0
                                                  ? ""
                                                  : data.totalAttendeeCount == 1
                                                      ? "${data.totalAttendeeCount} Attendee"
                                                      : "+${data.totalAttendeeCount} Attendees",
                                              style: const TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 12,
                                                  fontFamily: kCircularStdBook),
                                            ),
                                          )
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
                          "Agenda not Found",
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
                  "Agenda not Found",
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
}
