import 'package:daily_coders/core/theme/app_theme.dart';
import 'package:daily_coders/core/utils/strings.dart';
import 'package:daily_coders/router/app_router.dart';
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
      // Passing AppRouter which contains all the routes used in the app
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
