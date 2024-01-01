import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
    return TableCalendar(
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
          weekdayStyle: TextStyle(color: kTextSecondaryColor),
          weekendStyle: TextStyle(color: kTextSecondaryColor)),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronIcon: Icon(Icons.arrow_back_ios,
            color: kTextSecondaryColor), // Set the left icon
        rightChevronIcon: Icon(
          Icons.arrow_forward_ios_outlined,
          color: kTextSecondaryColor,
        ),
        titleTextStyle: TextStyle(
            color: kTextSecondaryColor,
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        defaultTextStyle: const TextStyle(color: kTextSecondaryColor),
        defaultDecoration: BoxDecoration(
          color: kSelectedIconColor,
          borderRadius: BorderRadius.circular(20),
        ),
        selectedDecoration: BoxDecoration(
          color: kBackGroundColor,
          shape: BoxShape.rectangle, // Set the shape to rectangle
          borderRadius:
              BorderRadius.circular(20), // Adjust the radius as needed
        ),
        holidayTextStyle: const TextStyle(color: kTextSecondaryColor),
        selectedTextStyle: const TextStyle(color: kPrimaryColor),
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
    );
  }
}
