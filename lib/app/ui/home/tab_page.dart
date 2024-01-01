import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../home/bt3.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import '../myAgenda/my_agenda.dart';
import '../../controller/tab_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class TabPage extends StatefulWidget {
  final String? tabIndexSubscription;
  final int? selectedTabIndex;
  const TabPage(
      {super.key, this.tabIndexSubscription, this.selectedTabIndex = 0});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  // FCMNotificationServices fCMNotificationServices = FCMNotificationServices();
  final controller = Get.put(TabCountController());
  String authToken = "";
  int accessLevel = 1;

  final TextStyle unselectedLabelStyle = const TextStyle(
      color: kTextSecondaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      fontFamily: kCircularStdNormal);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: kWhiteColor,
      fontWeight: FontWeight.w500,
      fontSize: 12,
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
                Bt3Page(),
                ProfilePage(),
              ],
            ),
          ),
        );
      },
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(
      () => SizedBox(
        height: Platform.isIOS ? 97 : 68,
        child: Theme(
          data: ThemeData(
            splashColor: kTransparentColor,
            highlightColor: kTransparentColor,
          ),
          child: BottomNavigationBar(
            elevation: 1,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
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
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Image.asset(
                    "assets/icons/homeicon.png",
                    color: landingPageController.tabIndex.value == 0
                        ? kSelectedIconColor
                        : kIconColor,
                    scale: 1.6,
                  ),
                ),
                label: 'Home',
                backgroundColor: kBackGroundColor,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Image.asset(
                    "assets/icons/discover_icon.png",
                    color: landingPageController.tabIndex.value == 1
                        ? kSelectedIconColor
                        : kIconColor,
                    scale: 1.7,
                  ),
                ),
                label: 'My Agenda',
                backgroundColor: kBackGroundColor,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Image.asset(
                    "assets/icons/message_icon.png",
                    color: landingPageController.tabIndex.value == 2
                        ? kSelectedIconColor
                        : kIconColor,
                    scale: 1.6,
                  ),
                ),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Image.asset(
                    "assets/icons/profile_icon.png",
                    color: landingPageController.tabIndex.value == 3
                        ? kSelectedIconColor
                        : kIconColor,
                    scale: 1.5,
                  ),
                ),
                label: 'Profile',
                backgroundColor: kBackGroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
