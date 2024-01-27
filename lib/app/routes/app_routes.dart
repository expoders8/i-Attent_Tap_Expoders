part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const tabPage = _Paths.tabPage;
  static const aboutPage = _Paths.aboutPage;
  static const qrCodePage = _Paths.qrCodePage;
  static const signInScreen = _Paths.signInScreen;
  static const galleryScreen = _Paths.galleryScreen;
  static const createActivity = _Paths.createActivity;
  static const eventDetailsPage = _Paths.eventDetailsPage;
  static const notificationPage = _Paths.notificationPage;
  static const dateSectionWidget = _Paths.dateSectionWidget;
  static const agendaDetailsPage = _Paths.agendaDetailsPage;
  static const membersDetailsPage = _Paths.membersDetailsPage;
  static const registerAttendeesPage = _Paths.registerAttendeesPage;
  static const conferenceDetailsPage = _Paths.conferenceDetailsPage;
}

abstract class _Paths {
  static const tabPage = '/tabPage';
  static const aboutPage = '/aboutPage';
  static const qrCodePage = '/qrCodePage';
  static const signInScreen = '/signInScreen';
  static const galleryScreen = '/galleryScreen';
  static const createActivity = '/createActivity';
  static const eventDetailsPage = '/eventDetailsPage';
  static const notificationPage = '/notificationPage';
  static const dateSectionWidget = '/dateSectionWidget';
  static const agendaDetailsPage = '/agendaDetailsPage';
  static const membersDetailsPage = '/membersDetailsPage';
  static const registerAttendeesPage = '/registerAttendeesPage';
  static const conferenceDetailsPage = '/conferenceDetailsPage';
}
