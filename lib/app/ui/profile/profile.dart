import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:dotted_border/dotted_border.dart';

import '../auth/sign_in.dart';
import '../../routes/app_pages.dart';
import '../../../config/constant/constant.dart';
import '../../services/firebase_auth_service.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "";
  String userEmail = "";
  String userImage = "";
  String userBadgeID = "";
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
      var name = "${getUserData['firstName']} ${getUserData['lastName']}";
      setState(() {
        userName = name;
        userEmail = getUserData['emailAddress'] ?? "";
        userImage = getUserData['profilePhoto'] ?? "";
        userBadgeID = getUserData['badgeID'] ?? "";
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
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        automaticallyImplyLeading: false,
        title:
            const Text("My Profile", style: TextStyle(color: kBackGroundColor)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 12, top: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DottedBorder(
                    strokeWidth: 0.75,
                    borderType: BorderType.Circle,
                    radius: const Radius.circular(30),
                    padding: EdgeInsets.zero,
                    child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                            color: kAppBarColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          alphBateName.toString(),
                          style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 25,
                              letterSpacing: 1),
                        ))),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 0),
                            SizedBox(
                              width: Get.width / 2,
                              child: Text(
                                userName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 18,
                                    fontFamily: kCircularStdMedium),
                              ),
                            ),
                            // const SizedBox(height: 5),
                            SizedBox(
                              width: Get.width / 2.10,
                              child: Text(
                                userEmail,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: kBlack54Color,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            TextButton.icon(
                              icon: const Icon(
                                Icons.logout_outlined,
                                color: kRedColor,
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 5)),
                              label: const Text(
                                "Logoff",
                                style: TextStyle(
                                  color: kRedColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: logoutConfirmationDialog,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.8,
              color: kDividerColor,
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "QR Code",
                        style: TextStyle(fontSize: 16, color: kBlack54Color),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: userBadgeID.toString(),
                      version: QrVersions.auto,
                      size: size.width > 500 ? 280 : 240.0,
                    ),
                    Text(
                      userBadgeID.toString(),
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Settings",
                        style: TextStyle(fontSize: 16, color: kBlack54Color),
                      ),
                    ),
                  ],
                ),
                CupertinoButton(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kIconColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Icon(Icons.settings,
                                  color: kBackGroundColor),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "About",
                              style: TextStyle(
                                  fontSize: 16, fontFamily: kCircularStdMedium),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 14,
                          color: kIconColor,
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.aboutPage);
                  },
                )
                // GestureDetector(
                //   onTap: () {
                //     Get.toNamed(Routes.aboutPage);
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 15, vertical: 10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           children: [
                //             Container(
                //               padding: const EdgeInsets.all(10),
                //               decoration: BoxDecoration(
                //                 color: kIconColor,
                //                 borderRadius: BorderRadius.circular(25),
                //               ),
                //               child: const Icon(Icons.settings,
                //                   color: kBackGroundColor),
                //             ),
                //             const SizedBox(width: 10),
                //             const Text(
                //               "About",
                //               style: TextStyle(
                //                   fontSize: 16,
                //                   fontFamily: kCircularStdMedium),
                //             ),
                //           ],
                //         ),
                //         const Icon(
                //           Icons.arrow_forward_ios_outlined,
                //           size: 14,
                //         )
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  userAccountDelete() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert !"),
        elevation: 5,
        titleTextStyle: const TextStyle(fontSize: 18, color: kRedColor),
        content: const Text("Are you sure want to Delete Account?"),
        contentPadding: const EdgeInsets.only(left: 25, top: 10),
        actions: <Widget>[
          TextButton(
            onPressed: () async {},
            child: const Text(
              'Yes',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'No',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  logoutConfirmationDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert !"),
        elevation: 5,
        titleTextStyle: const TextStyle(fontSize: 18, color: kRedColor),
        content: const Text("Are you sure want to logout?"),
        contentPadding: const EdgeInsets.only(left: 25, top: 10),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Get.back();
              getStorage.write('onBoard', 0);
              getStorage.remove('user');
              getStorage.remove('authToken');
              FirebaseAuthServices().signOut();
              Get.offAll(const SignInScreen());
            },
            child: const Text(
              'Yes',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'No',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
