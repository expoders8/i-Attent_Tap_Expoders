import 'package:get/get.dart';

import '../ui/auth/sign_in.dart';
import '../ui/home/tab_page.dart';

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
      page: () => SignInScreen(),
    ),
  ];
}
