import 'package:daily_coders/core/theme/app_theme.dart';
import 'package:daily_coders/core/utils/strings.dart';
import 'package:daily_coders/layers/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: appTheme,
      home: const MyHomePage(),
    );
  }
}
