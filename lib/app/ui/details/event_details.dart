import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            height: 180,
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
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
          builddetailsWidget(Icons.timer_outlined, "09:30 - 10:00 AM", ""),
          builddetailsWidget(
              Icons.calendar_month_outlined, "Monday, 11 December, 2019", ""),
          builddetailsWidget(Icons.location_on_outlined, "Lavaska Center", ""),
          const Divider(
            thickness: 0.8,
            color: kDividerColor,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(17, 3, 0, 5),
            child: const Text(
              "About",
              style: TextStyle(
                color: kTitleColor,
                fontSize: 17,
                fontFamily: kCircularStdBold,
              ),
            ),
          ),
          builddetailsWidget(
              Icons.description, "Lavaska Center", "Description"),
          const Divider(
            thickness: 0.8,
            color: kDividerColor,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(17, 13, 0, 8),
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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              padding: const EdgeInsets.only(bottom: 5.0),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 0),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        right: 10.0, left: 10.0, top: 5.0, bottom: 5.0),
                    child: Card(
                      elevation: 7,
                      shadowColor: const Color.fromARGB(50, 0, 0, 0),
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: kCardColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 110,
                                  decoration: const BoxDecoration(
                                      color: kBackGroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(14),
                                          bottomLeft: Radius.circular(15))),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 20),
                                  child: const Column(
                                    children: [
                                      Text(
                                        "09:30 AM",
                                        style: TextStyle(
                                            color: kTitleColor,
                                            fontFamily: kCircularStdMedium,
                                            fontSize: 13.2),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "09:45 AM",
                                        style: TextStyle(
                                            color: kTitleSecondColor,
                                            fontFamily: kCircularStdMedium,
                                            fontSize: 13.2),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 19.8),
                                    Text(
                                      "Coffee with Aim Team",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdMedium,
                                          fontSize: 15),
                                    ),
                                    SizedBox(height: 25),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: kPrimaryColor,
                                          size: 18,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          "Coral Lounge",
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 13,
                                              fontFamily: kCircularStdNormal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(height: 5),
                                IconButton(
                                  onPressed: () {
                                    addMyAgendaDialog(context);
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "+2   ",
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 15,
                                            fontFamily: kCircularStdMedium),
                                      ),
                                      for (int i = 0; i < image.length; i++)
                                        Align(
                                          widthFactor: 0.3,
                                          child: Image.asset(
                                            image[i],
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              "assets/images/blank_profile.png",
                                              fit: BoxFit.fill,
                                            ),
                                            scale: 2,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
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

  builddetailsWidget(IconData icon, String value, String text) {
    return Padding(
      padding: text == "Description"
          ? const EdgeInsets.only(left: 15, top: 11, bottom: 18, right: 10)
          : const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
