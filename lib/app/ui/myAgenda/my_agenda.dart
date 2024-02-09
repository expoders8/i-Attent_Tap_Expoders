import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';
import '../../view/agenda_view.dart';
import '../widgets/data_section.dart';
import '../../controller/agenda_controller.dart';
import '../../../config/constant/color_constant.dart';
import '../widgets/selfCheckIdHome.dart';

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
        leading: IconButton(
          icon: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: kBackGroundColor,
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(
                Icons.qr_code_scanner,
                color: kSelectedIconColor,
                size: 21,
              )),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const SelfCheckInHome(),
              ),
            );
          },
        ),
        actions: <Widget>[
          Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
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
                    scale: 2.2,
                  )),
            ),
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
