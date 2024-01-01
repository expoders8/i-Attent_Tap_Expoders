import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

typedef StringCallback = void Function(String val);

class DatePickerWidget extends StatefulWidget {
  final StringCallback callbackDate;
  final String oldSelectedDate;

  const DatePickerWidget(
      {Key? key, required this.callbackDate, required this.oldSelectedDate})
      : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  String selectdate = "YYYY/MM/DD";
  String newDate = '';

  checkExistingDate() {
    selectdate = newDate != "" ? newDate : widget.oldSelectedDate;
  }

  @override
  Widget build(BuildContext context) {
    checkExistingDate();
    return Container(
      height: 45,
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width * 0.43,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kWhiteColor),
      ),
      child: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
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
              String formattedDate = DateFormat('yyyy-MM-dd').format(date);
              setState(() {
                selectdate = formattedDate;
                newDate = formattedDate;
                widget.callbackDate(formattedDate);
              });
            },
            currentTime: DateTime.now(),
            locale: LocaleType.en,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectdate == "" ? "YYYY/MM/DD" : selectdate,
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
    );
  }
}

class TimePickerWidget extends StatefulWidget {
  final StringCallback callbackTime;
  final StringCallback callbackConvertedTime;
  final bool timeError;
  final String oldSelectedTime;
  const TimePickerWidget(
      {Key? key,
      required this.callbackTime,
      required this.callbackConvertedTime,
      required this.timeError,
      required this.oldSelectedTime})
      : super(key: key);

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  var selectTime = "Time";
  String newTime = '';

  checkExistingTime() {
    selectTime = newTime != "" ? newTime : widget.oldSelectedTime;
  }

  @override
  Widget build(BuildContext context) {
    checkExistingTime();
    return Container(
      height: 45,
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width * 0.43,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: widget.timeError == true ? kErrorColor : kWhiteColor)),
      child: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
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
              String convertedTime = DateFormat("hh:mm a").format(time);
              String formattedTime = DateFormat('HH:mm:ss').format(time);
              setState(() {
                selectTime = convertedTime;
                newTime = convertedTime;
                widget.callbackTime(formattedTime);
                widget.callbackConvertedTime(convertedTime);
              });
            },
            currentTime: DateTime.now(),
            locale: LocaleType.en,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectTime == "" ? "Time" : selectTime,
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
    );
  }
}
