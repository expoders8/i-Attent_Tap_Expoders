import 'package:get/get.dart';

import '../ui/home/tab_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.onBoard;

  static final routes = [
    GetPage(
      name: _Paths.tabPage,
      page: () => const TabPage(),
    ),
  ];
}
