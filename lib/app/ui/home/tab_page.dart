import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../home/bt3.dart';
import '../home/bt4.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import '../../controller/tab_controller.dart';
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
      color: kTextSecondaryColor, fontWeight: FontWeight.w500, fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 12);

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
                Bt3Page(),
                Bt4Page(),
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
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(Icons.grid_view_rounded, size: 25.0),
                ),
                label: 'Home',
                backgroundColor: kBackGroundColor,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(Icons.search, size: 28.0),
                ),
                label: 'Test',
                backgroundColor: kBackGroundColor,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(Icons.favorite, size: 25.0),
                ),
                label: 'Test',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(Icons.person_sharp, size: 25.0),
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
