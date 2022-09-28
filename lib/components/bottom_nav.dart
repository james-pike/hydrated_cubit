import 'package:flutter/material.dart';
import '../localization/language_constants.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int bottomNavIndex = 0;
  void indexSelected(int index) {
    setState(() {
      bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: getTranslated(context, "components.bottom_nav.home_label"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.business),
          label: getTranslated(context, "components.bottom_nav.tbd_label"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.business),
          label: getTranslated(context, "components.bottom_nav.tbd_label"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle_rounded),
          label: getTranslated(context, "components.bottom_nav.profile_label"),
        ),
      ],
      currentIndex: bottomNavIndex,
      selectedItemColor: Colors.red[700],
      onTap: indexSelected,
    );
  }
}

