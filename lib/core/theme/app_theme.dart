import 'package:flutter/material.dart';

/// This is the ThemeData for the app.
/// It is used to set the default theme for the app.

/*
Constants
*/
const Color appBarColor = Color(0xFF0A0C23);
const Color scaffoldColor = Color(0xFF0A0C23);
const Color listColor = Color(0xff1D1E23);
const Color floatingButtonbackground = Color(0xff006778);
const TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 28.0);

final MaterialColor appSwatch =
    createMaterialColor(const Color.fromRGBO(3, 218, 197, 1));

final appTheme = ThemeData(
  primarySwatch: appSwatch,
  primaryColor: appSwatch.shade500,
  scaffoldBackgroundColor: scaffoldColor,
  fontFamily: 'RobotoSlab',
  appBarTheme: AppBarTheme(
    color: appBarColor,
    centerTitle: true,
    // appbar text color
    foregroundColor: appSwatch.shade300,
    iconTheme: const IconThemeData().copyWith(color: Colors.black),
  ),
);

// create material color from a color to use in app theme
// https://stackoverflow.com/questions/50549539/how-to-add-custom-color-to-flutter
MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = <int, Color>{};
  // ignore: avoid_multiple_declarations_per_line
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (final strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
