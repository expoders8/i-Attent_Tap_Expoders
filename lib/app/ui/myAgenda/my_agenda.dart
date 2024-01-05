import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../widgets/data_section.dart';
import '../myAgenda/components/agenda_list.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class MyAgendaPage extends StatefulWidget {
  const MyAgendaPage({super.key});

  @override
  State<MyAgendaPage> createState() => _MyAgendaPageState();
}

class _MyAgendaPageState extends State<MyAgendaPage> {
  String formattedDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
  int tabSelection = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kSelectedIconColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "My Agenda",
          style: TextStyle(
              color: kWhiteColor, fontFamily: kCircularStdNormal, fontSize: 18),
        ),
      ),
      body: const Column(
        children: [DateSectionWidget(), AgendaListPage()],
      ),
    );
  }
}
