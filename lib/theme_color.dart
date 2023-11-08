import 'package:flutter/material.dart';

class ThemeColor {
  static var redColor = Color(0xFFAA0315);
  static ThemeData timePicker = ThemeData(
    colorScheme: ColorScheme(
        primary: Colors.black,
        secondary: Colors.black,
        surface: Colors.white,
        background: Colors.white,
        error: redColor,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.white,
        onError: redColor,
        brightness: Brightness.light),
    textTheme: TextTheme(
      caption: TextStyle(
        color: redColor,
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
