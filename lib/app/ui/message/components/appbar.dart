import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/constant/constant.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';
import '../../../controller/tab_controller.dart';
import '../../../routes/app_pages.dart';

typedef StringCallback = void Function(String val);

class MessageAppBar extends StatefulWidget {
  final StringCallback callbackSearchQuery;
  const MessageAppBar({
    Key? key,
    required this.callbackSearchQuery,
  }) : super(key: key);

  @override
  State<MessageAppBar> createState() => _MessageAppBarState();
}

class _MessageAppBarState extends State<MessageAppBar> {
  TextEditingController searchController = TextEditingController();
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
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: Platform.isAndroid ? 110 : 110,
                color: kAppBarColor,
                // backgroundColor: kAppBarColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, left: 2.5),
                      child: IconButton(
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
                                  color: kSelectedIconColor,
                                  fontSize: 15,
                                  letterSpacing: 1),
                            ))),
                        onPressed: () {
                          tabcontroller.changeTabIndex(4);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: Platform.isAndroid ? 5.0 : 5.0),
                      child: const Center(
                          child: Text(
                        "Messages",
                        style: TextStyle(
                          color: kBackGroundColor,
                          fontSize: 20,
                          fontFamily: kCircularStdMedium,
                        ),
                      )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.notificationPage);
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
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
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: Platform.isAndroid ? 85 : 85,
            left: 15,
            right: 15,
            child: Container(
              height: 45,
              decoration: const BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(25, 158, 158, 158),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: PhysicalModel(
                color: kBlack38Color,
                borderRadius: BorderRadius.circular(8),
                elevation: 2.0,
                shadowColor: kBlack54Color,
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    errorMaxLines: 1,
                    hintText: "Search",
                    prefixIcon: Image.asset(
                      'assets/icons/discover_icon.png',
                      scale: 2.5,
                      color: kPrimaryColor,
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: kCircularStdBook,
                    ),
                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.cancel_outlined,
                              size: 15,
                            ),
                            color: kPrimaryColor,
                            splashColor: kTransparentColor,
                            onPressed: () {
                              setState(() {});
                              searchController.clear();
                              widget.callbackSearchQuery(searchController.text);
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: kWhiteColor,
                    errorStyle: const TextStyle(fontSize: 10),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide(color: kWhiteColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: kWhiteColor, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                    widget.callbackSearchQuery(searchController.text);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
