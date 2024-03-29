import 'package:confrance_expoders/app/ui/profile/profile.dart';
import 'package:get/get.dart';

import '../ui/about/about.dart';
import '../ui/auth/sign_in.dart';
import '../ui/home/tab_page.dart';
import '../ui/details/event_details.dart';
import '../ui/details/agenda_details.dart';
import '../ui/widgets/gallery_custom.dart';
import '../ui/notification/notification.dart';
import '../ui/details/conference_details.dart';
import '../ui/crerate_agenda/create_activity.dart';

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
      name: _Paths.createActivity,
      page: () => const CreateActivity(),
    ),
    GetPage(
      name: _Paths.profilePage,
      page: () => const ProfilePage(),
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
      name: _Paths.conferenceDetailsPage,
      page: () => const ConferenceDetailsPage(),
    ),
    GetPage(
      name: _Paths.agendaDetailsPage,
      page: () => const AgendaDetailsPage(),
    ),
    GetPage(
      name: _Paths.galleryScreen,
      page: () => const GalleryScreen(),
    ),
    GetPage(
      name: _Paths.aboutPage,
      page: () => const AboutPage(),
    ),
  ];
}
