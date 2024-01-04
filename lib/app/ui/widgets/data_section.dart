import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../config/constant/color_constant.dart';

class DateSectionWidget extends StatefulWidget {
  const DateSectionWidget({super.key});

  @override
  State<DateSectionWidget> createState() => _DateSectionWidgetState();
}

class _DateSectionWidgetState extends State<DateSectionWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();

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

    // print("Selected Day: $selectedDay");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: Get.width,
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _selectedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        calendarFormat: _calendarFormat,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        onDaySelected: _onDaySelected,
        daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: kTitleColor),
            weekendStyle: TextStyle(color: kTextSecondaryColor)),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronVisible: true,
          rightChevronVisible: true,
          titleTextStyle: TextStyle(color: kTitleColor, fontSize: 15),
          headerPadding: EdgeInsets.symmetric(horizontal: 1, vertical: 14),
        ),
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          defaultTextStyle: const TextStyle(color: kTitleColor),
          defaultDecoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          selectedDecoration: BoxDecoration(
            color: kSelectedIconColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
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
      ),
    );
  }
}
