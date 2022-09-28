import 'package:flutter/material.dart';
import 'package:csp/components/nav_drawer.dart';
import 'package:csp/components/bottom_nav.dart';
import '../localization/language_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text(getTranslated(context, "pages.home.title")),
        centerTitle: true,
        backgroundColor: Colors.red[600],
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
