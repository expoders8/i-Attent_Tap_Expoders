import 'package:confrance_expoders/config/constant/constant.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'app/routes/app_pages.dart';
import 'config/provider/theme_provider.dart';

int? isviewed = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (getStorage.read('firstTimeLaunch') == null) {
    getStorage.erase();
    getStorage.remove('user');
    getStorage.remove('authToken');
    getStorage.write('firstTimeLaunch', true);
    getStorage.write('onBoard', 0);
  }
  isviewed = getStorage.read('onBoard');
  return runApp(
    ChangeNotifierProvider<ThemeProvider>(
      child: const MyApp(),
      create: (BuildContext context) {
        const isDark = false;
        return ThemeProvider(isDark);
      },
    ),
  );
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Provider.of<ThemeProvider>(context, listen: false).getTheme(),
      initialRoute: isviewed == 0 ? Routes.signInScreen : Routes.tabPage,
      getPages: AppPages.routes,
    );
  }
}
