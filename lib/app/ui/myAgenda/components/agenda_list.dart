import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/constant/color_constant.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../routes/app_pages.dart';

class AgendaListPage extends StatefulWidget {
  const AgendaListPage({super.key});

  @override
  State<AgendaListPage> createState() => _AgendaListPageState();
}

class _AgendaListPageState extends State<AgendaListPage> {
  List image = [
    "assets/images/i-test.png",
    "assets/images/i-test1.png",
    // "assets/images/i-test2.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: kBackGroundColor,
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.agendaDetailsPage);
              },
              child: Padding(
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
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.minimize_outlined,
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
