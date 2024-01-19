part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const tabPage = _Paths.tabPage;
  static const qrCodePage = _Paths.qrCodePage;
  static const signInScreen = _Paths.signInScreen;
  static const createActivity = _Paths.createActivity;
  static const eventDetailsPage = _Paths.eventDetailsPage;
  static const dateSectionWidget = _Paths.dateSectionWidget;
  static const notificationPage = _Paths.notificationPage;
  static const agendaDetailsPage = _Paths.agendaDetailsPage;
  static const membersDetailsPage = _Paths.membersDetailsPage;
  static const registerAttendeesPage = _Paths.registerAttendeesPage;
  static const conferenceDetailsPage = _Paths.conferenceDetailsPage;
  static const splashScreen = _Paths.splashScreen;
  static const galleryScreen = _Paths.galleryScreen;
  static const aboutPage = _Paths.aboutPage;
}

abstract class _Paths {
  static const tabPage = '/tabPage';
  static const qrCodePage = '/qrCodePage';
  static const signInScreen = '/signInScreen';
  static const createActivity = '/createActivity';
  static const eventDetailsPage = '/eventDetailsPage';
  static const dateSectionWidget = '/dateSectionWidget';
  static const notificationPage = '/notificationPage';
  static const agendaDetailsPage = '/agendaDetailsPage';
  static const membersDetailsPage = '/membersDetailsPage';
  static const registerAttendeesPage = '/registerAttendeesPage';
  static const conferenceDetailsPage = '/conferenceDetailsPage';
  static const splashScreen = '/splashScreen';
  static const galleryScreen = '/galleryScreen';
  static const aboutPage = '/aboutPage';
}
