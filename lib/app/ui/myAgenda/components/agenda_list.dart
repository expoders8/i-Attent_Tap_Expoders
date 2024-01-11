import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../controller/agenda_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';

class AgendaListPage extends StatefulWidget {
  const AgendaListPage({super.key});

  @override
  State<AgendaListPage> createState() => _AgendaListPageState();
}

class _AgendaListPageState extends State<AgendaListPage> {
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
    // "assets/images/i-test2.png"
  ];
  final GetAllAgendaController getAllAgendaController =
      Get.put(GetAllAgendaController());
  final GetDetailsAgendaController getDetailsAgendaController =
      Get.put(GetDetailsAgendaController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (getAllAgendaController.isLoading.value) {
            return Container(
              color: kBackGroundColor,
              child: const Center(
                child: CircularProgressIndicator(),
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
                              getDetailsAgendaController
                                  .agendaIdString(data.id.toString());
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
                                          const SizedBox(height: 8),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              width: 40,
                                              height: 40,
                                              child: Image.asset(
                                                'assets/icons/calendar_minus.png',
                                                color: const Color(0xFF415880),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 1.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Text(
                                                    data.totalAttendeeCount == 0
                                                        ? ""
                                                        : "+${data.totalAttendeeCount}",
                                                    style: const TextStyle(
                                                        color: kPrimaryColor,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            kCircularStdBook),
                                                  ),
                                                ),
                                                for (int i = 0;
                                                    i < image.length;
                                                    i++)
                                                  data.totalAttendeeCount == 0
                                                      ? Container()
                                                      : Align(
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
