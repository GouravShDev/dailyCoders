import 'package:flutter/material.dart';

/*
Constants
*/
const Color appBarColor = Color(0xFF0A0C23);
const Color scaffoldColor = Color(0xFF0A0C23);
const Color listColor = Color(0xff1D1E23);
const Color floatingButtonbackground = Color(0xff006778);
const TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 28.0);

/*
Theme data
*/
ThemeData appTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(color: appBarColor),
  scaffoldBackgroundColor: scaffoldColor,
);
