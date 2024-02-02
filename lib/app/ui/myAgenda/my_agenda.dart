import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/constant.dart';
import '../../controller/tab_controller.dart';
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
  String formattedDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
  int tabSelection = 0;
  String selectedDate = "";
  final GetAllAgendaController getAllAgendaController =
      Get.put(GetAllAgendaController());
  final tabcontroller = Get.put(TabCountController());
  String alphBateName = "";
  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);
    if (getUserData != null) {
      setState(() {
        if (getUserData['lastName'] == null) {
          List<String> nameParts = getUserData['firstName'].split(" ");
          String firstName = nameParts[0];
          String lastName = nameParts[1];
          String firstNameLetter = firstName.substring(0, 1);
          String lastNameLetter = lastName.substring(0, 1);
          var alphBateLater = "$firstNameLetter$lastNameLetter";
          alphBateName = alphBateLater;
        } else {
          String firstNameLetter = getUserData['firstName'].substring(0, 1);
          String lastNameLetter = getUserData['lastName'].substring(0, 1);
          var alphBateLater = "$firstNameLetter$lastNameLetter";
          alphBateName = alphBateLater;
        }
      });
    }
  }

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
              child: Center(
                  child: Text(
                alphBateName.toString(),
                style: const TextStyle(
                    color: kSelectedIconColor, fontSize: 15, letterSpacing: 1),
              ))),
          onPressed: () {
            tabcontroller.changeTabIndex(4);
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
