import 'dart:io';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../config/constant/color_constant.dart';

typedef StringCallback = void Function(String val);

class DateSectionWidget extends StatefulWidget {
  final StringCallback callbackDate;
  const DateSectionWidget({super.key, required this.callbackDate});

  @override
  State<DateSectionWidget> createState() => _DateSectionWidgetState();
}

class _DateSectionWidgetState extends State<DateSectionWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime todayDate = DateTime.now();
  bool focuseToday = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
      });
    }
    String formattedDate = DateFormat('dd/MM/yyyy').format(_selectedDay);
    widget.callbackDate(formattedDate);
    String today = DateFormat('dd/MM/yyyy').format(todayDate);
    if (formattedDate == today) {
      setState(() {
        focuseToday = false;
      });
    } else {
      setState(() {
        focuseToday = true;
      });
    }

    // print("Selected Day: $selectedDay");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: Get.width,
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        rowHeight: 51,
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _selectedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        calendarFormat: _calendarFormat,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        onDaySelected: _onDaySelected,
        daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: kTitleColor),
            weekendStyle: TextStyle(color: kTextSecondaryColor)),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronVisible: true,
          rightChevronVisible: true,
          titleTextStyle: const TextStyle(color: kTitleColor, fontSize: 15),

          headerPadding: const EdgeInsets.symmetric(horizontal: 1),

          leftChevronIcon: const Row(
            children: [
              Icon(
                Icons.chevron_left,
              ),
              SizedBox(
                height: 48,
                width: 48,
              ),
            ],
          ), // Custom right icon
          rightChevronIcon: Row(
            children: [
              focuseToday
                  ? IconButton(
                      focusColor: kBackGroundColor,
                      hoverColor: kBackGroundColor,
                      highlightColor: kBackGroundColor,
                      onPressed: () {
                        setState(() {
                          _selectedDay = DateTime.now();
                          focuseToday = false;
                          String today =
                              DateFormat('dd/MM/yyyy').format(todayDate);
                          widget.callbackDate(today);
                        });
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                    )
                  : const SizedBox(
                      height: 48,
                      width: 48,
                    ),
              const Icon(
                Icons.chevron_right,
              ),
            ],
          ), // Custom right icon
        ),
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          defaultTextStyle: const TextStyle(color: kTitleColor),
          defaultDecoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(Platform.isIOS ? 20 : 30),
          ),
          selectedDecoration: BoxDecoration(
            color: kSelectedIconColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Platform.isIOS ? 20 : 30),
          ),
          holidayTextStyle: const TextStyle(color: kTextSecondaryColor),
          selectedTextStyle: const TextStyle(color: kWhiteColor),
          weekendTextStyle: const TextStyle(color: kTextSecondaryColor),
        ),
        onFormatChanged: (formet) {
          if (_calendarFormat != formet) {
            setState(() {
              _calendarFormat = formet;
            });
          }
        },
        onHeaderTapped: (focusedDay) {
          setState(() {
            _calendarFormat = (_calendarFormat == CalendarFormat.week)
                ? CalendarFormat.month
                : CalendarFormat.week;
          });
        },
        onPageChanged: ((focusedDay) {
          String formattedpageDate = DateFormat('MM').format(focusedDay);
          String todayPage = DateFormat('MM').format(todayDate);
          if (formattedpageDate == todayPage) {
            focuseToday = true;
          } else {
            focuseToday = true;
          }
        }),
      ),
    );
  }
}
