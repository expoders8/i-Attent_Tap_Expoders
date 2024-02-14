import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';
import '../../view/agenda_view.dart';
import '../widgets/data_section.dart';
import '../../controller/agenda_controller.dart';
import '../../../config/constant/color_constant.dart';

class MyAgendaPage extends StatefulWidget {
  const MyAgendaPage({super.key});

  @override
  State<MyAgendaPage> createState() => _MyAgendaPageState();
}

class _MyAgendaPageState extends State<MyAgendaPage> {
  String selectedDate = "";
  final GetAllAgendaController getAllAgendaController =
      Get.put(GetAllAgendaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        automaticallyImplyLeading: false,
        title:
            const Text("My Agenda", style: TextStyle(color: kBackGroundColor)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.notificationPage);
            },
            child: Container(
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(15, 0, 0, 0),
                  blurRadius: 10.0,
                ),
              ]),
              margin: const EdgeInsets.only(right: 14),
              child: Image.asset(
                "assets/icons/notification.png",
                scale: 2.1,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: ClipOval(
              child: Material(
                  child: Image.asset(
                "assets/images/blank_profile.png",
                width: 30,
                height: 30,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  "assets/images/blank_profile.png",
                  fit: BoxFit.fill,
                ),
                fit: BoxFit.cover,
              )),
            ),
            onPressed: () {
              Get.toNamed(Routes.profilePage);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          DateSectionWidget(
            callbackDate: (val) {
              getAllAgendaController.selectedDateString(val);
              getAllAgendaController.fetchAllAgenda();
            },
          ),
          const AgendaViewPage()
        ],
      ),
    );
  }
}
