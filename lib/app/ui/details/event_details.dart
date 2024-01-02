import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../routes/app_pages.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
    "assets/images/i-test2.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            height: 220,
            decoration: const BoxDecoration(
              color: kSelectedIconColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 0),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 35.0, bottom: 20),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kWhiteColor,
                      size: 17,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 18),
                    Container(
                        height: 80,
                        width: 48,
                        decoration: BoxDecoration(
                            color: kBackGroundColor,
                            borderRadius: BorderRadius.circular(30)),
                        // padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Mon",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "29",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 55,
                              height: 26,
                              decoration: const BoxDecoration(
                                  color: kOrangeColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                              child: const Center(
                                child: Text(
                                  "2023",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(width: 15),
                    const SizedBox(
                        width: 170,
                        child: Text(
                          "Coffee with Aim Team",
                          style: TextStyle(
                              color: kBackGroundColor,
                              fontFamily: kCircularStdMedium,
                              fontSize: 20),
                        )),
                  ],
                ),
                const SizedBox(height: 2)
              ],
            ),
          ),

          const SizedBox(height: 15),
          // Row(
          //   children: [
          //     for (int i = 0; i < image.length; i++)
          //       Image.asset(
          //         image[i],
          //         errorBuilder: (context, error, stackTrace) => Image.asset(
          //           "assets/images/blank_profile.png",
          //           fit: BoxFit.fill,
          //         ),
          //         scale: 2,
          //         fit: BoxFit.cover,
          //       ),
          //   ],
          // ),
          builddetailsWidget(Icons.timer_outlined, "09:30 - 10:00 AM"),
          builddetailsWidget(
              Icons.calendar_month_outlined, "Monday, 11 December, 2019"),
          builddetailsWidget(Icons.location_on_outlined, "Lavaska Center"),
          // const Padding(
          //   padding: EdgeInsets.only(left: 47.0),
          //   child: Text(
          //     "34 East Road Bakery,near CP,New Delhi 67",
          //     style: TextStyle(
          //       color: kSecondaryPrimaryColor,
          //       fontSize: 15,
          //       fontFamily: kCircularStdBold,
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 10),
          // builddetailsWidget(Icons.description,
          //     "A Discussion on the new app Hobbify. Be ready with your topics"),
          const Divider(
            thickness: 0.8,
            color: kDividerColor,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(17, 20, 0, 0),
            child: const Text(
              "Sessions",
              style: TextStyle(
                color: kTitleColor,
                fontSize: 17,
                fontFamily: kCircularStdBold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: Get.width,
              // height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 10),
                          child: Text("09:30 AM"),
                        ),
                        const SizedBox(width: 10),
                        Card(
                          elevation: 6,
                          shadowColor: const Color.fromARGB(50, 0, 0, 0),
                          child: Container(
                            height: 110,
                            width: Get.width - 115,
                            decoration: const BoxDecoration(
                                color: kCardColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Coffee with Aim Team",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: kCircularStdMedium,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "09:30 - 10:00 AM",
                                            style: TextStyle(
                                                color: kTextSecondaryColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: kWorkSans),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            addMyAgendaDialog(context);
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: kPrimaryColor,
                                          ))
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: kPrimaryColor,
                                        size: 18,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        "To Be Announced",
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 14,
                                            fontFamily: kCircularStdNormal),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  addMyAgendaDialog(context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: kCardColor,
        title: const Text("Alert !"),
        elevation: 5,
        titleTextStyle: const TextStyle(fontSize: 19, color: kRedColor),
        content: const Text("Are you sure want to Add in My Agenda?"),
        contentPadding: const EdgeInsets.only(left: 25, top: 10),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Get.back();
            },
            child: const Text(
              'Yes',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
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

  builddetailsWidget(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: kTitleColor,
            size: 22,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: Get.width - 70,
            child: Text(
              value,
              style: const TextStyle(
                color: kSecondaryPrimaryColor,
                fontSize: 15,
                fontFamily: kCircularStdMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
