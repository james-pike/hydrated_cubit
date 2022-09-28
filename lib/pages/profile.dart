import 'package:flutter/material.dart';
import 'package:csp/components/nav_drawer.dart';
import 'package:csp/components/bottom_nav.dart';
import '../localization/language_constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text(getTranslated(context, "pages.profile.title")),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

