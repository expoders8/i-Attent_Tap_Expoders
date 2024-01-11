import 'package:get/get.dart';

import '../ui/agenda_details/Register_Attendees_details.dart';
import '../ui/auth/sign_in.dart';
import '../ui/details/conference_details.dart';
import '../ui/details/event_details.dart';
import '../ui/home/tab_page.dart';
import '../ui/myAgenda/create_activity.dart';
import '../ui/notification/notification.dart';
import '../ui/profile/qr_code.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.signInScreen;

  static final routes = [
    GetPage(
      name: _Paths.tabPage,
      page: () => const TabPage(),
    ),
    GetPage(
      name: _Paths.signInScreen,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: _Paths.qrCodePage,
      page: () => const QrCodePage(),
    ),
    GetPage(
      name: _Paths.createActivity,
      page: () => const CreateActivity(),
    ),
    GetPage(
      name: _Paths.eventDetailsPage,
      page: () => const EventDetailsPage(),
    ),
    GetPage(
      name: _Paths.notificationPage,
      page: () => const NotificationPage(),
    ),
    GetPage(
      name: _Paths.registerAttendeesPage,
      page: () => const RegisterAttendeesPage(),
    ),
    GetPage(
      name: _Paths.conferenceDetailsPage,
      page: () => const ConferenceDetailsPage(),
    ),
  ];
}
