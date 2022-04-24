import 'package:daily_coders/layers/ui/pages/home/home_page.dart';
import 'package:daily_coders/layers/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomePage.route:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case LoginPage.route:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      default:
        return null;
    }
  }
}
