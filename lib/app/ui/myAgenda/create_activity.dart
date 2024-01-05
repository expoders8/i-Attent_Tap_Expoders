import 'package:flutter/material.dart';

import '../widgets/date_time_picker.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class CreateActivity extends StatefulWidget {
  const CreateActivity({super.key});

  @override
  State<CreateActivity> createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  final _formKey = GlobalKey<FormState>();
  bool isTouched = false, isFormSubmitted = false;
  String pickedDate = "",
      pickedStartTime = "",
      pickedEndTime = "",
      oldDate = "",
      newDate = "",
      oldTime = "",
      newStartTime = "",
      newEndTime = "",
      oldConvertedTime = "",
      convertedStartTime = "",
      convertedEndTime = "";

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Activity"),
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
                                    onChanged: ((value) {}),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kIconColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kIconColor),
                                      ),
                                      contentPadding: EdgeInsets.only(top: 5),
                                      hintText: 'Title',
                                      hintStyle: TextStyle(
                                        fontFamily: kCircularStdNormal,
                                        fontWeight: FontWeight.w400,
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
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
                                    onChanged: ((value) {}),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kIconColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kIconColor),
                                      ),
                                      contentPadding: EdgeInsets.only(top: 5),
                                      hintText: 'Description',
                                      hintStyle: TextStyle(
                                        fontFamily: kCircularStdNormal,
                                        fontWeight: FontWeight.w400,
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
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
                          DatePickerWidget(
                            callbackDate: (val) {
                              if (mounted) {
                                setState(() {
                                  pickedStartTime = val;
                                  newStartTime = val;
                                });
                              }
                            },
                            oldSelectedDate: oldDate,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TimePickerWidget(
                            timeError: false,
                            callbackTime: (val) {
                              if (mounted) {
                                setState(() {
                                  pickedStartTime = val;
                                  newStartTime = val;
                                });
                              }
                            },
                            callbackConvertedTime: (val) {
                              if (mounted) {
                                setState(() => convertedStartTime = val);
                              }
                            },
                            oldSelectedTime: oldTime,
                          ),
                          //   callbackConvertedTime: (val) {
                          //     if (mounted) {
                          //       setState(() => convertedTime = val);
                          //     }
                          //   },
                          //   oldSelectedTime: oldTime,
                          // ),
                          // timeError == true
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
                buildTextWidget("End Date and Time"),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DatePickerWidget(
                            callbackDate: (val) {
                              if (mounted) {
                                setState(() {
                                  pickedEndTime = val;
                                  newEndTime = val;
                                });
                              }
                            },
                            oldSelectedDate: oldDate,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TimePickerWidget(
                            timeError: false,
                            callbackTime: (val) {
                              if (mounted) {
                                setState(() {
                                  pickedEndTime = val;
                                  newEndTime = val;
                                });
                              }
                            },
                            callbackConvertedTime: (val) {
                              if (mounted) {
                                setState(() => convertedEndTime = val);
                              }
                            },
                            oldSelectedTime: oldTime,
                          ),
                          //   callbackConvertedTime: (val) {
                          //     if (mounted) {
                          //       setState(() => convertedTime = val);
                          //     }
                          //   },
                          //   oldSelectedTime: oldTime,
                          // ),
                          // timeError == true
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
                buildTextField("Enter", locationcontroller, false,
                    isFormSubmitted, isTouched),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {},
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

  showSnackbar(msg) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        backgroundColor: kPrimaryColor,
        behavior: SnackBarBehavior.floating,
        width: 200,
      ));
  }

  showDetailPageAfterUpdate(context) {
    Navigator.of(context).pop(1);
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

  Widget buildTextField(String hintText, TextEditingController controller,
      bool value, bool isFormSubmitted, bool isTouched) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (isTouched || isFormSubmitted) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
              }
              return null;
            },
            keyboardType: value == true ? TextInputType.number : null,
            controller: controller,
            onChanged: (value) => {
              isTouched = true,
            },
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
