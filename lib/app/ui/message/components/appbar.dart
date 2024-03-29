import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';
import '../../../controller/tab_controller.dart';
import '../../../../config/constant/constant.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';

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
    Size size = MediaQuery.of(context).size;
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
                      padding: const EdgeInsets.only(top: 1.5, left: 9),
                      child: GestureDetector(
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
                            scale: 2.1,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: Platform.isAndroid ? 0.0 : 5.0),
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
                    IconButton(
                      icon: ClipOval(
                        child: Material(
                            child: Image.asset(
                          "assets/images/blank_profile.png",
                          width: 30,
                          height: 30,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
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
              ),
            ],
          ),
          Positioned(
            top: Platform.isAndroid
                ? 85
                : size.width > 500
                    ? 95
                    : 85,
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
                    hintText: "Search Lastname",
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
