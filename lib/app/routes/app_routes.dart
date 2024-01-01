part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const tabPage = _Paths.tabPage;
  static const qrCodePage = _Paths.qrCodePage;
  static const signInScreen = _Paths.signInScreen;
  static const createActivity = _Paths.createActivity;
  static const eventDetailsPage = _Paths.eventDetailsPage;
  static const dateSectionWidget = _Paths.dateSectionWidget;
}

abstract class _Paths {
  static const tabPage = '/tabPage';
  static const qrCodePage = '/qrCodePage';
  static const signInScreen = '/signInScreen';
  static const createActivity = '/createActivity';
  static const eventDetailsPage = '/eventDetailsPage';
  static const dateSectionWidget = '/dateSectionWidget';
}
