import 'package:get/get.dart';
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
      body: Column(
        children: [
          Container(
            width: Get.width,
            padding:
                const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 10),
            color: kSelectedIconColor,
            child: Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kWhiteColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tabSelection = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: tabSelection == 0
                              ? kSelectedIconColor
                              : kWhiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 12),
                      child: Text(
                        "Full Agenda",
                        style: TextStyle(
                            color: tabSelection == 0
                                ? kWhiteColor
                                : kSelectedIconColor,
                            fontSize: 16,
                            fontFamily: kCircularStdNormal),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tabSelection = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: tabSelection == 1
                              ? kSelectedIconColor
                              : kWhiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      child: Text(
                        "My Agenda",
                        style: TextStyle(
                            color: tabSelection == 1
                                ? kWhiteColor
                                : kSelectedIconColor,
                            fontSize: 16,
                            fontFamily: kCircularStdNormal),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const DateSectionWidget(),
          const AgendaListPage()
        ],
      ),
    );
  }
}
