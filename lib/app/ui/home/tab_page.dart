import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';
import '../myAgenda/my_agenda.dart';
import '../message/message_page.dart';
import '../widgets/selfCheckIdHome.dart';
import '../../controller/tab_controller.dart';
import '../crerate_agenda/create_activity.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class TabPage extends StatefulWidget {
  final String? screenDef;
  final int? selectedTabIndex;
  const TabPage({super.key, this.screenDef, this.selectedTabIndex = 0});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final controller = Get.put(TabCountController());
  String authToken = "";
  int accessLevel = 1;
  @override
  void initState() {
    controller.changeTabIndex(widget.selectedTabIndex!.toInt());
    super.initState();
  }

  final TextStyle unselectedLabelStyle = const TextStyle(
      color: kIconColor,
      fontWeight: FontWeight.w500,
      fontSize: 11,
      fontFamily: kCircularStdNormal);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: kSelectedIconColor,
      fontWeight: FontWeight.w500,
      fontSize: 11,
      fontFamily: kCircularStdNormal);

  @override
  Widget build(BuildContext context) {
    final TabCountController tabCountController =
        Get.put(TabCountController(), permanent: false);

    return GetBuilder<TabCountController>(
      builder: (context) {
        return Scaffold(
          bottomNavigationBar:
              buildBottomNavigationMenu(context, tabCountController),
          body: Obx(
            () => IndexedStack(
              index: tabCountController.tabIndex.value,
              children: const [
                HomePage(),
                MyAgendaPage(),
                CreateActivity(),
                MessagePage(),
                SelfCheckInHome(),
              ],
            ),
          ),
        );
      },
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: Platform.isIOS ? 8 : 0),
        height: Platform.isIOS ? 100 : 68,
        child: Theme(
          data: ThemeData(
            splashColor: kTransparentColor,
            highlightColor: kTransparentColor,
          ),
          child: BottomNavigationBar(
            elevation: 1,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: ((value) {
              landingPageController.changeTabIndex(value);
              if (widget.screenDef == "Details") {
                Get.offAll(
                  () => TabPage(
                    screenDef: "Home",
                    selectedTabIndex: value,
                  ),
                );
              }
            }),
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: kBackGroundColor,
            unselectedItemColor: kIconColor,
            selectedItemColor: kSelectedIconColor,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 7.0, top: 2),
                  child: Image.asset(
                    "assets/icons/homeicon.png",
                    color: landingPageController.tabIndex.value == 0
                        ? kSelectedIconColor
                        : kIconColor,
                    scale: 1.7,
                  ),
                ),
                label: 'Home',
                backgroundColor: kBackGroundColor,
              ),
              const BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Icon(
                      Icons.calendar_month_outlined,
                      size: 22,
                    )),
                label: 'My Agenda',
                backgroundColor: kBackGroundColor,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 5.5),
                  child: landingPageController.tabIndex.value == 2
                      ? Image.asset(
                          "assets/icons/plus_iconslected.png",
                          scale: 2.4,
                        )
                      : Image.asset(
                          "assets/icons/plus_iconunselect.png",
                          scale: 2.4,
                        ),
                ),
                label: '',
                backgroundColor: kBackGroundColor,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 5),
                  child: Image.asset(
                    "assets/icons/message_icon.png",
                    color: landingPageController.tabIndex.value == 3
                        ? kSelectedIconColor
                        : kIconColor,
                    scale: 1.7,
                  ),
                ),
                label: 'Message',
              ),
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 7.0, top: 3),
                  child: Icon(
                    Icons.qr_code_scanner,
                    size: 20,
                  ),
                  // Image.asset(
                  //   "assets/icons/profile_icon.png",
                  //   color: landingPageController.tabIndex.value == 4
                  //       ? kSelectedIconColor
                  //       : kIconColor,
                  //   scale: 1.5,
                  // ),
                ),
                label: 'Check-in',
                backgroundColor: kBackGroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
