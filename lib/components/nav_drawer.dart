import 'package:csp/pages/home.dart';
import 'package:csp/pages/profile.dart';
import 'package:csp/pages/settings_preferences.dart';
import 'package:flutter/material.dart';
import '../localization/language_constants.dart';
import '../pages/settings.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String headerName = 'Eric Torunski';
    String headerRole = getTranslated(context, "components.nav_drawer.user_occupation");
    String initials = 'ET';

    return Drawer(
      child: Material(
          color: Colors.red[400],
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              children: <Widget>[
                buildHeader(
                    headerName: headerName,
                    headerRole: headerRole,
                    initials: initials,
                    onClicked: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()),
                        )),
                buildMenuItem(
                  text: getTranslated(context, "components.nav_drawer.home_item_title"),
                  icon: Icons.home,
                  onClicked: () => selectedItem(context, 0),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: getTranslated(context, "components.nav_drawer.profile_item_title"),
                  icon: Icons.people,
                  onClicked: () => selectedItem(context, 1),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: getTranslated(context, "components.nav_drawer.courses_item_title"),
                  icon: Icons.medical_services,
                  onClicked: () => selectedItem(context, 2),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: getTranslated(context, "components.nav_drawer.certifications_item_title"),
                  icon: Icons.check_box,
                  onClicked: () => selectedItem(context, 3),
                ),
                const SizedBox(height: 24),
                const Divider(color: Colors.white70, thickness: 1.0),
                const SizedBox(height: 24),
                buildMenuItem(
                  text: getTranslated(context, "components.nav_drawer.payments_item_title"),
                  icon: Icons.payment,
                  onClicked: () => selectedItem(context, 4),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: getTranslated(context, "components.nav_drawer.settings_item_title"),
                  icon: Icons.settings,
                  onClicked: () => selectedItem(context, 5),
                ),
              ])),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      onTap: onClicked,
      hoverColor: hoverColor,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop(); //removes menu after item selected,
    //prevents page buildup on the stack.
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Settings(),
        ));
        break;
    }
  }

  Widget buildHeader({
    required String headerName,
    required String headerRole,
    required String initials,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white70,
                  foregroundColor: Colors.red[600],
                  child: Text(initials)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headerName,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    headerRole,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      );
}
