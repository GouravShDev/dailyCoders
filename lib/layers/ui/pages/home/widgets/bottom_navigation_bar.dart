import 'package:daily_coders/core/theme/app_theme.dart';
import 'package:daily_coders/core/utils/strings.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: kBottomBarBgColor, // <-- This works for fixed
      selectedItemColor: kBottomBarSelectedItem,
      unselectedItemColor: kBottomBarUnSelectedItem,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: Strings.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_album_outlined),
          label: Strings.dailyChallenge,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box_outlined),
          label: Strings.profile,
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
