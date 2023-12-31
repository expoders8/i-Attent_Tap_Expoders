import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:dotted_border/dotted_border.dart';

import '../auth/sign_in.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        leadingWidth: 60,
        automaticallyImplyLeading: false,
        title: const Text("My Profile"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: kDividerColor,
            height: 1.0,
          ),
        ),
      ),
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {},
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DottedBorder(
                      strokeWidth: 0.75,
                      borderType: BorderType.Circle,
                      radius: const Radius.circular(30),
                      padding: const EdgeInsets.all(3),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipOval(
                            child: Material(
                          color: kTransparentColor,
                          child: Image.asset(
                            "assets/images/blank_profile.png",
                            scale: 1,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              "assets/images/blank_profile.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10),
                              SizedBox(
                                width: Get.width / 2.27,
                                child: const Text(
                                  "Jone Brams",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 18,
                                      fontFamily: kCircularStdMedium),
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: Get.width / 2.10,
                                child: const Text(
                                  "Jone@gmail.com",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
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
                                        const EdgeInsets.fromLTRB(0, 5, 0, 5)),
                                label: const Text(
                                  "Logout",
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
              const SizedBox(height: 20),
              Column(
                children: [
                  QrImageView(
                    data: 'Jones Brams',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  const SizedBox(height: 15),
                  const Divider(
                    thickness: 0.8,
                    color: kDividerColor,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Use your QR Code to:"),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 13, 2, 10),
                          child: Text(
                              "- Check in to yout event if yout event is using i-Attent-TAP's check-in sevice"),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 7, 2, 10),
                          child: Text(
                              "- Give exhibitors and vendors your contact info(if your event has exhibitors)"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
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
