import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
    "assets/images/i-test2.png"
  ];
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        automaticallyImplyLeading: false,
        title: const Text(""),
        leading: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Color.fromARGB(15, 0, 0, 0),
                blurRadius: 10.0,
              ),
            ]),
            margin: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: CircleAvatar(
                backgroundColor: kBackGroundColor,
                child: ClipOval(
                  child: Material(
                      child: Image.asset(
                    "assets/images/blank_profile.png",
                    width: 33,
                    height: 33,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      "assets/images/blank_profile.png",
                      fit: BoxFit.fill,
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              onPressed: () {},
            ),
          ),
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
                  margin: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    "assets/icons/notification.png",
                    scale: 2.5,
                  )),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    errorMaxLines: 1,
                    hintText: "Search Conferences",
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
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: kWhiteColor,
                    errorStyle: const TextStyle(fontSize: 10),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(14.0),
                      ),
                      borderSide: BorderSide(color: kWhiteColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide:
                          const BorderSide(color: kWhiteColor, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: const BorderSide(
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.eventDetailsPage);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
                          elevation: 6,
                          shadowColor: const Color.fromARGB(50, 0, 0, 0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: kCardColor,
                                borderRadius: BorderRadius.circular(14.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Coffee with Aim Team",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: kCircularStdMedium,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      Text(
                                        "$formattedDate 04:30 AM - 07:30 AM",
                                        style: const TextStyle(
                                            color: kTextSecondaryColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: kWorkSans),
                                      ),
                                      const SizedBox(height: 25),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: kPrimaryColor,
                                                size: 18,
                                              ),
                                              Text(
                                                "To Be Announced",
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 14,
                                                    fontFamily:
                                                        kCircularStdNormal),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "+2 Sessions",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          kCircularStdBook),
                                                ),
                                                // const SizedBox(width: 10),
                                                // for (int i = 0;
                                                //     i < image.length;
                                                //     i++)
                                                //   Align(
                                                //     widthFactor: 0.3,
                                                //     child: Image.asset(
                                                //       image[i],
                                                //       errorBuilder: (context, error,
                                                //               stackTrace) =>
                                                //           Image.asset(
                                                //         "assets/images/blank_profile.png",
                                                //         fit: BoxFit.fill,
                                                //       ),
                                                //       scale: 2,
                                                //       fit: BoxFit.cover,
                                                //     ),
                                                //   ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
