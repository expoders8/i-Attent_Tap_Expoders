import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../config/constant/font_constant.dart';
import '../../models/event_model.dart';
import '../../../config/constant/color_constant.dart';

class DateSectionWidget extends StatefulWidget {
  const DateSectionWidget({super.key});

  @override
  State<DateSectionWidget> createState() => _DateSectionWidgetState();
}

class _DateSectionWidgetState extends State<DateSectionWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focuseDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};

  @override
  void initState() {
    _selectedDay = _focuseDay;
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
        _focuseDay = focusedDay;
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    _calendarFormat = CalendarFormat.week;
    return Container(
      color: kWhiteColor,
      width: Get.width,
      height: 120,
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        availableCalendarFormats: const {
          CalendarFormat.week: 'Week',
        },
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        calendarFormat: _calendarFormat,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        onDaySelected: _onDaySelected,
        eventLoader: _getEventsForDay,
        daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: kTitleColor),
            weekendStyle: TextStyle(color: kTextSecondaryColor)),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronVisible: false,
          rightChevronVisible: false,
          titleTextStyle: TextStyle(color: kTitleColor, fontSize: 15),
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
        onPageChanged: (focusedDay) {
          _focuseDay = focusedDay;
        },
      ),
    );
  }
}
