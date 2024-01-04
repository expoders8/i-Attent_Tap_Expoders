import 'package:flutter/material.dart';

import '../constant/font_constant.dart';
import '../constant/color_constant.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeData? _selectedTheme;
  static const fontFamilyNormal = kCircularStdNormal;
  static const fontFamilyMedium = kCircularStdMedium;

  static BoxDecoration scaffoldDecoration =
      BoxDecoration(color: primary.colorScheme.background);

  static ThemeData primary = ThemeData(
    fontFamily: fontFamilyNormal,
    splashColor: const Color(0x7E112E78),
    disabledColor: const Color(0xFF003399),
    scaffoldBackgroundColor: kBackGroundColor,
    hintColor: Colors.black54,
    highlightColor: Colors.transparent,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: fontFamilyMedium),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: kWhiteColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: kPrimaryColor,
        fontSize: 20,
        fontFamily: fontFamilyMedium,
      ),
    ),
    cardTheme: const CardTheme(
      color: Colors.white, // Set the default card color to white
    ),
    listTileTheme: const ListTileThemeData(textColor: kPrimaryColor),
    primaryColor: Colors.red,
    primaryColorDark: Colors.red,
    sliderTheme: const SliderThemeData(
      activeTickMarkColor: Colors.black54,
      activeTrackColor: Colors.black54,
      overlayColor: Colors.black54,
      inactiveTickMarkColor: Colors.black45,
      inactiveTrackColor: Colors.black45,
      thumbColor: Colors.black54,
    ),
    iconTheme: const IconThemeData(
      color: kBlack54Color,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
        backgroundColor: MaterialStateProperty.all(kButtonColor),
      ),
    ),
  );

  ThemeProvider(isDarkTheme) {
    scaffoldDecoration = BoxDecoration(color: primary.colorScheme.background);
    _selectedTheme = primary;
  }

  ThemeData? getTheme() => _selectedTheme;
}
