import 'package:csp/pages/settings_account.dart';
import 'package:csp/pages/settings_preferences.dart';
import 'package:flutter/material.dart';
import '../localization/language_constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with SingleTickerProviderStateMixin {
  late TabController _controller;

  ///Initialize TabBar controller with length of 2.
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, "pages.settings.title")),
        backgroundColor: Colors.red[600],
        centerTitle: true,

        ///TabBar implementation
        bottom: TabBar(controller: _controller, tabs: <Tab>[
          Tab(text: getTranslated(context, "pages.settings.preferences"),
              icon: const Icon(Icons.cloud_outlined)),
          Tab(text: getTranslated(context, "pages.settings.account"),
              icon: const Icon(Icons.integration_instructions_outlined)),
        ]),
      ),

      ///TabBarView defines which page is displayed.
      body: TabBarView(
        controller: _controller,
        children: const <Widget>[
          SettingsPreferences(),
          SettingsAccount(),
        ],
      ),
    );
  }

  ///Dispose/close controller.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
