import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';


extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

ThemeData _appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.green,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.green, elevation: 0),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.green,
      )
  ),
  primarySwatch: Colors.grey,
);

getApplicationTheme() {
  return _appTheme;
}