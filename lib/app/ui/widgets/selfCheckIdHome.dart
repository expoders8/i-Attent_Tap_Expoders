// ignore: file_names
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'CheckIn.dart';
import 'qr_scanner_widget.dart';
import '../../routes/app_pages.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class SelfCheckInHome extends StatefulWidget {
  const SelfCheckInHome({super.key});

  static const String route = "/home";

  @override
  State<SelfCheckInHome> createState() => _HomeState();
}

class _HomeState extends State<SelfCheckInHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        automaticallyImplyLeading: false,
        title: const Text("i-Attend Self Check-in",
            style: TextStyle(color: kBackGroundColor)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 6.0),
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
              margin: const EdgeInsets.only(right: 14),
              child: Image.asset(
                "assets/icons/notification.png",
                scale: 2.1,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: ClipOval(
              child: Material(
                  child: Image.asset(
                "assets/images/blank_profile.png",
                width: 30,
                height: 30,
                errorBuilder: (context, error, stackTrace) => Image.asset(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAppBarColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const QrCodeScanner(),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.qr_code_scanner_outlined,
                        color: kWhiteColor,
                        size: 21,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Scan QR CODE",
                        style: TextStyle(
                            color: kWhiteColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 17),
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CheckIn(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 38.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/pencil.png",
                          color: kWhiteColor,
                          height: 26,
                          width: 26,
                        ),
                        const SizedBox(width: 18),
                        const Text(
                          "Enter PIN",
                          style: TextStyle(
                              color: kWhiteColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 17),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // SafeArea(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Row(
      //         children: [
      //           Expanded(
      //             flex: 6,
      //             child: TextButton(
      //               style: TextButton.styleFrom(
      //                 padding: const EdgeInsets.symmetric(
      //                   vertical: 18,
      //                   horizontal: 4,
      //                 ),
      //                 backgroundColor: const Color(0xFF92140c),
      //                 foregroundColor: Colors.white,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(0),
      //                 ),
      //               ),
      //               child: Text(
      //                 'Scan QR CODE',
      //                 textAlign: TextAlign.center,
      //                 style: Theme.of(context)
      //                     .textTheme
      //                     .titleLarge
      //                     ?.copyWith(color: Colors.white),
      //               ),
      //               onPressed: () {
      //                 Navigator.of(context).push(
      //                   MaterialPageRoute(
      //                     builder: (_) => const QrCodeScanner(),
      //                   ),
      //                 );
      //               },
      //             ),
      //           ),
      //           Expanded(
      //             flex: 4,
      //             child: TextButton(
      //               style: TextButton.styleFrom(
      //                 padding: const EdgeInsets.symmetric(
      //                   vertical: 18,
      //                   horizontal: 4,
      //                 ),
      //                 backgroundColor: Colors.black,
      //                 foregroundColor: Colors.white,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(0),
      //                 ),
      //               ),
      //               child: Text(
      //                 'Enter PIN',
      //                 textAlign: TextAlign.center,
      //                 style: Theme.of(context)
      //                     .textTheme
      //                     .titleLarge
      //                     ?.copyWith(color: Colors.white),
      //               ),
      //               onPressed: () {
      //                 Navigator.of(context).push(
      //                   MaterialPageRoute(
      //                     builder: (_) => const CheckIn(),
      //                   ),
      //                 );
      //               },
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class SliderPage extends StatelessWidget {
  final int index;

  const SliderPage(this.index, {super.key});

  final TextStyle _bulletStyle =
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0);

  List<Widget> buildPageContent(BuildContext context) {
    switch (index) {
      case 1:
        return [
          Image.asset(
            'assets/images/Professional_Development_Programs.jpg',
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 16.0),
          const Text('Track Professional Development Programs',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 21.0,
                  letterSpacing: 1.2)),
          const SizedBox(height: 16.0),
          MyBullet(
            child: Text(
              'Employee/Staff Training',
              style: _bulletStyle,
            ),
          ),
          const SizedBox(height: 4.0),
          MyBullet(
            child: Text(
              'OSHA Compliance tracking and reporting',
              style: _bulletStyle,
            ),
          ),
          const SizedBox(height: 4.0),
          MyBullet(
            child: Text(
              'Continuing Education for professionals in healthcare, law, insurance, technology, accounting and '
              'real-estate',
              style: _bulletStyle,
            ),
          ),
          const SizedBox(height: 4.0),
          MyBullet(
            child: Text(
              'Generate, distribute and store certificates',
              style: _bulletStyle,
            ),
          ),
          const SizedBox(height: 4.0),
          MyBullet(
            child: Text(
              'Create name badges',
              style: _bulletStyle,
              softWrap: true,
            ),
          ),
          const SizedBox(height: 4.0),
        ];

      case 2:
        return [
          Image.asset(
            'assets/images/Schools_and_School_Districts.jpg',
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 16.0),
          const Text('Attendance for Schools and School Districts',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 21.0,
                  letterSpacing: 1.2)),
          const SizedBox(height: 16.0),
          MyBullet(
            child: Text(
              'Student and Faculty Attendance Tracking',
              style: _bulletStyle,
            ),
          ),
          const SizedBox(height: 4.0),
          MyBullet(
            child: Text(
              'Student Transport (bus attendance)',
              style: _bulletStyle,
            ),
          ),
          const SizedBox(height: 4.0),
          MyBullet(
            child: Text(
              'Evacuation Drills',
              style: _bulletStyle,
            ),
          ),
          const SizedBox(height: 4.0),
          MyBullet(
            child: Text(
              'Student Certificates',
              style: _bulletStyle,
            ),
          ),
        ];

      case 3:
        return [
          Image.asset(
            'assets/images/EventsAndConference.jpg',
            fit: BoxFit.fitWidth,
            width: 650.0,
          ),
          const SizedBox(height: 16.0),
          const Text('Manage Events and Conferences',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.0,
                  letterSpacing: 1.2)),
          const SizedBox(height: 16.0),
          MyBullet(
            child: Text(
              'Track attendance in breakout sessions',
              style: _bulletStyle,
            ),
          ),
          const SizedBox(height: 4.0),
          MyBullet(
            child: Text(
              'Trade shows and booth attendance',
              style: _bulletStyle,
            ),
          ),
          const SizedBox(height: 4.0),
          MyBullet(
            child: Text(
              'Print custom name badges',
              style: _bulletStyle,
            ),
          ),
          const SizedBox(height: 4.0),
          MyBullet(
            child: Text(
              'Create registration forms for attendees',
              style: _bulletStyle,
            ),
          ),
          const SizedBox(height: 4.0),
          MyBullet(
            child: Text(
              'Generate evaluation or surveys for events',
              style: _bulletStyle,
              softWrap: true,
            ),
          ),
          const SizedBox(height: 4.0),
        ];

      case 4:
        return [
          const Text('i-Attend : No More Pen and Paper Sign-in Sheets!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.0,
                  letterSpacing: 1.2)),
          const SizedBox(height: 18.0),
          const Text(
              '''i-Attend is cloud-based platform designed to Track Attendance at Events, Classes, Workshops, Continuing Education, Employee Training or any other meets!

Create Name Badges, Generate Certificates, Distribute Evaluation, Register Attendees - all these in a single platform.''',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0)),
          const SizedBox(height: 16.0),
        ];

      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackGroundColor,
      child: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 600.0,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 32.0, bottom: 40.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: buildPageContent(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  final Widget child;

  final double bulletSize;

  final Color color;

  final BoxShape shape;

  const MyBullet({
    super.key,
    required this.child,
    this.bulletSize = 8.0,
    this.color = Colors.black,
    this.shape = BoxShape.circle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: bulletSize,
            width: bulletSize,
            margin: const EdgeInsets.only(left: 20.0, right: 6.0),
            decoration: BoxDecoration(
              color: color,
              shape: shape,
            ),
          ),
          Expanded(child: child),
          const SizedBox(
            width: 20.0,
          )
        ],
      ),
    );
  }
}
