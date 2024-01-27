import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';

import '../../services/agenda_service.dart';
import '../../controller/tab_controller.dart';
import '../../../config/constant/constant.dart';
import '../../controller/agenda_controller.dart';
import '../../services/notification_service.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';
import '../../../config/provider/snackbar_provider.dart';

class CreateActivity extends StatefulWidget {
  const CreateActivity({super.key});

  @override
  State<CreateActivity> createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  final _formKey = GlobalKey<FormState>();
  bool isTouched = false,
      isFormSubmitted = false,
      descriptionError = false,
      titleError = false,
      startDateError = false,
      endDateError = false,
      startTimeError = false,
      endTimeError = false;
  String pickedStartTime = "",
      userId = "",
      pickedStartDate = "",
      pickedEndDate = "",
      pickedEndTime = "",
      newStartTime = "",
      selectStartdate = "YYYY/MM/DD",
      selectEnddate = "YYYY/MM/DD",
      newEndTime = "";
  var selectStartTime = "Time";
  var selectEndTime = "Time";
  final controller = Get.put(TabCountController());
  final GetAllAgendaController getAllAgendaController =
      Get.put(GetAllAgendaController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationcontroller = TextEditingController();
  AgendaService agendaService = AgendaService();
  NotificationService notificationService = NotificationService();

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          title: const Text(
            "Create Activity",
            style: TextStyle(color: kBackGroundColor),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Card(
                  shadowColor: const Color.fromARGB(10, 0, 0, 0),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kCardColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: titleController,
                                    textInputAction: TextInputAction.next,
                                    onChanged: ((value) {
                                      setState(() {
                                        if (titleController.text != "") {
                                          titleError = false;
                                        } else {
                                          titleError = true;
                                        }
                                      });
                                    }),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: titleError == true
                                                ? kErrorColor
                                                : kIconColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: titleError == true
                                                ? kErrorColor
                                                : kIconColor),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.only(top: 5),
                                      hintText: 'Title',
                                      hintStyle: const TextStyle(
                                        fontFamily: kCircularStdNormal,
                                        fontWeight: FontWeight.w400,
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  titleError == true
                                      ? const Padding(
                                          padding:
                                              EdgeInsets.only(left: 5, top: 5),
                                          child: Text(
                                            "Title is required",
                                            style: TextStyle(
                                                color: kErrorColor,
                                                fontSize: 11,
                                                fontFamily: kCircularStdBook),
                                          ),
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    controller: descriptionController,
                                    onChanged: ((value) {
                                      setState(() {
                                        if (descriptionController.text != "") {
                                          descriptionError = false;
                                        } else {
                                          descriptionError = true;
                                        }
                                      });
                                    }),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: descriptionError == true
                                                ? kErrorColor
                                                : kIconColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: descriptionError == true
                                                ? kErrorColor
                                                : kIconColor),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.only(top: 5),
                                      hintText: 'Description',
                                      hintStyle: const TextStyle(
                                        fontFamily: kCircularStdNormal,
                                        fontWeight: FontWeight.w400,
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  descriptionError == true
                                      ? const Padding(
                                          padding:
                                              EdgeInsets.only(left: 5, top: 5),
                                          child: Text(
                                            "Description is required",
                                            style: TextStyle(
                                                color: kErrorColor,
                                                fontSize: 11,
                                                fontFamily: kCircularStdBook),
                                          ),
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  ),
                ),
                buildTextWidget("Start Date and Time"),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            margin: const EdgeInsets.only(top: 5),
                            width: MediaQuery.of(context).size.width * 0.43,
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: startDateError == true
                                      ? kErrorColor
                                      : kWhiteColor),
                            ),
                            child: InkWell(
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                DatePickerBdaya.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2050, 1, 1),
                                  theme: const DatePickerThemeBdaya(
                                    backgroundColor: kBackGroundColor,
                                    itemStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                    ),
                                    doneStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                    cancelStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  onConfirm: (date) {
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd').format(date);
                                    setState(() {
                                      selectStartdate = formattedDate;
                                      pickedStartDate = formattedDate;
                                      newStartTime = formattedDate;
                                      startDateError = false;
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en,
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectStartdate == ""
                                        ? "YYYY/MM/DD"
                                        : selectStartdate,
                                    style: const TextStyle(
                                      fontFamily: kCircularStdBook,
                                      fontWeight: FontWeight.w400,
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/icons/polygon_down.png",
                                    scale: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          startDateError == true
                              ? const Padding(
                                  padding: EdgeInsets.only(left: 10, top: 6),
                                  child: Text(
                                    "Date is required",
                                    style: TextStyle(
                                      color: kErrorColor,
                                      fontSize: 11,
                                      fontFamily: kCircularStdBook,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            margin: const EdgeInsets.only(top: 5),
                            width: MediaQuery.of(context).size.width * 0.43,
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: startTimeError == true
                                        ? kErrorColor
                                        : kWhiteColor)),
                            child: InkWell(
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                DatePickerBdaya.showTimePicker(
                                  context,
                                  showTitleActions: true,
                                  theme: const DatePickerThemeBdaya(
                                    backgroundColor: kBackGroundColor,
                                    itemStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                    ),
                                    doneStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                    cancelStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  onConfirm: (time) {
                                    String convertedTime =
                                        DateFormat("hh:mm a").format(time);
                                    String formattedTime =
                                        DateFormat('HH:mm:ss').format(time);
                                    setState(() {
                                      selectStartTime = convertedTime;
                                      newStartTime = convertedTime;
                                      pickedStartTime = formattedTime;
                                      startTimeError = false;
                                      // widget.callbackTime(formattedTime);
                                      // widget.callbackConvertedTime(convertedTime);
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en,
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectStartTime == ""
                                        ? "Time"
                                        : selectStartTime,
                                    style: const TextStyle(
                                      fontFamily: kCircularStdBook,
                                      fontWeight: FontWeight.w400,
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/icons/polygon_down.png",
                                    scale: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          startTimeError == true
                              ? const Padding(
                                  padding: EdgeInsets.only(left: 10, top: 6),
                                  child: Text(
                                    "Time is required",
                                    style: TextStyle(
                                      color: kErrorColor,
                                      fontSize: 11,
                                      fontFamily: kCircularStdBook,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
                buildTextWidget("End Date and Time"),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            margin: const EdgeInsets.only(top: 5),
                            width: MediaQuery.of(context).size.width * 0.43,
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color:
                                      // endDateError == true
                                      //     ? kErrorColor
                                      //     :
                                      kWhiteColor),
                            ),
                            child: InkWell(
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                DatePickerBdaya.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2050, 1, 1),
                                  theme: const DatePickerThemeBdaya(
                                    backgroundColor: kBackGroundColor,
                                    itemStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                    ),
                                    doneStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                    cancelStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  onConfirm: (date) {
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd').format(date);
                                    setState(() {
                                      selectEnddate = formattedDate;
                                      pickedEndDate = formattedDate;
                                      newEndTime = formattedDate;
                                      // endDateError = false;
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en,
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectEnddate == ""
                                        ? "YYYY/MM/DD"
                                        : selectEnddate,
                                    style: const TextStyle(
                                      fontFamily: kCircularStdBook,
                                      fontWeight: FontWeight.w400,
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/icons/polygon_down.png",
                                    scale: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // endDateError == true
                          //     ? const Padding(
                          //         padding: EdgeInsets.only(left: 10, top: 6),
                          //         child: Text(
                          //           "Date is required",
                          //           style: TextStyle(
                          //             color: kErrorColor,
                          //             fontSize: 11,
                          //             fontFamily: kCircularStdBook,
                          //           ),
                          //         ),
                          //       )
                          //     : Container(),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            margin: const EdgeInsets.only(top: 5),
                            width: MediaQuery.of(context).size.width * 0.43,
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color:
                                        // endTimeError == true
                                        //     ? kErrorColor
                                        //     :
                                        kWhiteColor)),
                            child: InkWell(
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                DatePickerBdaya.showTimePicker(
                                  context,
                                  showTitleActions: true,
                                  theme: const DatePickerThemeBdaya(
                                    backgroundColor: kBackGroundColor,
                                    itemStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                    ),
                                    doneStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                    cancelStyle: TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  onConfirm: (time) {
                                    String convertedTime =
                                        DateFormat("hh:mm a").format(time);
                                    String formattedTime =
                                        DateFormat('HH:mm:ss').format(time);
                                    setState(() {
                                      selectEndTime = convertedTime;
                                      newStartTime = convertedTime;
                                      pickedEndTime = formattedTime;
                                      // endTimeError = false;
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en,
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectEndTime == ""
                                        ? "Time"
                                        : selectEndTime,
                                    style: const TextStyle(
                                      fontFamily: kCircularStdBook,
                                      fontWeight: FontWeight.w400,
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/icons/polygon_down.png",
                                    scale: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // endTimeError == true
                          //     ? const Padding(
                          //         padding: EdgeInsets.only(left: 10, top: 6),
                          //         child: Text(
                          //           "Time is required",
                          //           style: TextStyle(
                          //             color: kErrorColor,
                          //             fontSize: 11,
                          //             fontFamily: kCircularStdBook,
                          //           ),
                          //         ),
                          //       )
                          //     : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
                buildTextWidget("Location"),
                buildTextField(
                  "Enter",
                  locationcontroller,
                  false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isFormSubmitted = true;
                        });
                        Future.delayed(const Duration(milliseconds: 100),
                            () async {
                          if (_formKey.currentState!.validate() &&
                              pickedStartTime != "" &&
                              pickedStartDate != "") {
                            FocusScope.of(context).requestFocus(FocusNode());
                            addMyAgendaBottomSheet(context);
                          } else {
                            if (pickedStartTime == "") {
                              setState(() {
                                startTimeError = true;
                              });
                            } else {
                              setState(() {
                                startTimeError = false;
                              });
                            }

                            if (pickedStartDate == "") {
                              setState(() {
                                startDateError = true;
                              });
                            } else {
                              setState(() {
                                startDateError = false;
                              });
                            }
                            if (titleController.text == "") {
                              setState(() {
                                titleError = true;
                              });
                            } else {
                              setState(() {
                                titleError = false;
                              });
                            }
                            if (descriptionController.text == "") {
                              setState(() {
                                descriptionError = true;
                              });
                            } else {
                              setState(() {
                                descriptionError = false;
                              });
                            }
                          }
                        });
                      },
                      child: const Text(
                        "Create an Activity",
                        style: TextStyle(
                            color: kWhiteColor, fontFamily: kCircularStdNormal),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  clearallFild() {
    titleController.clear();
    descriptionController.clear();
    locationcontroller.clear();
    setState(() {
      pickedStartDate = "";
      pickedEndDate = "";
      pickedStartTime = "";
      pickedEndTime = "";
      selectStartTime = "";
      selectEndTime = "";
      selectStartdate = "";
      selectEnddate = "";
    });
  }

  addMyAgendaBottomSheet(context) async {
    return showModalBottomSheet<dynamic>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: kWhiteColor,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            const Center(
              child: ImageIcon(
                AssetImage("assets/icons/line.png"),
                size: 30,
                color: Color(0XffBFC5CC),
              ),
            ),
            Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0),
                      child: Text(
                        "Session addes to My agenda. Do you also want to add reminder to phone",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kTitleColor,
                            fontFamily: kCircularStdBold,
                            fontSize: 15),
                      ),
                    ),
                    const Divider(
                      thickness: 0.8,
                      color: kDividerColor,
                    ),
                    buildRemindersTime("Remind me 10 min before"),
                    buildRemindersTime("Remind me 20 min before"),
                    buildRemindersTime("Remind me 30 min before"),
                    buildRemindersTime("No reminder"),
                  ],
                )),
          ],
        );
      },
    );
  }

  buildRemindersTime(String time) {
    return GestureDetector(
      onTap: () {
        Get.back();
        LoaderX.show(context, 60.0, 60.0);
        notificationService
            .addReminder(
                time == "Remind me 10 min before"
                    ? 10
                    : time == "Remind me 20 min before"
                        ? 20
                        : time == "Remind me 30 min before"
                            ? 20
                            : 0,
                0,
                userId)
            .then((value) => {
                  if (value['success'])
                    {
                      agendaService
                          .addAgenda(
                              titleController.text,
                              descriptionController.text,
                              locationcontroller.text,
                              "${pickedStartDate}T$pickedStartTime",
                              "${pickedEndDate}T$pickedEndTime",
                              null,
                              userId)
                          .then((value) => {
                                if (value['data'])
                                  {
                                    LoaderX.hide(),
                                    controller.changeTabIndex(1),
                                    getAllAgendaController.fetchAllAgenda(),
                                    clearallFild()
                                  }
                                else
                                  {
                                    LoaderX.hide(),
                                    SnackbarUtils.showErrorSnackbar(
                                        "Failed to Add Agenda",
                                        value["message"])
                                  }
                              })
                    }
                  else
                    {
                      LoaderX.hide(),
                      SnackbarUtils.showErrorSnackbar(
                          "Failed to Add Agenda", value['message'].toString())
                    }
                });
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

  Widget buildTextWidget(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(7, 20, 0, 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontFamily: kCircularStdBold,
        ),
      ),
    );
  }

  Widget buildTextField(
    String hintText,
    TextEditingController controller,
    bool value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // validator: (value) {
            //   if (isTouched || isFormSubmitted) {
            //     if (value == null || value.isEmpty) {
            //       return 'Location is required';
            //     }
            //   }
            //   return null;
            // },
            keyboardType: value == true ? TextInputType.number : null,
            controller: controller,
            // onChanged: (value) => {
            //   isTouched = true,
            // },
            decoration: InputDecoration(
              hintText: hintText,
              counterText: "",
              contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              hintStyle: const TextStyle(
                fontFamily: kCircularStdBook,
                fontWeight: FontWeight.w400,
                color: kPrimaryColor,
                fontSize: 14,
              ),
              filled: true,
              fillColor: kWhiteColor,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                borderSide: BorderSide(color: kWhiteColor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: kWhiteColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
