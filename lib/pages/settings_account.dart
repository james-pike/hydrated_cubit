import 'package:flutter/cupertino.dart';

class SettingsAccount extends StatefulWidget {
  const SettingsAccount({Key? key}) : super(key: key);

  @override
  State<SettingsAccount> createState() => _SettingsAccountState();
}

class _SettingsAccountState extends State<SettingsAccount> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child:
      Column(
        children: const [
          SizedBox(height: 20),
          Text("Payments"),
          Text("Email/Password"),
          Text("Privacy/FAQ"),
          Text("Logout"),
        ],
      ),
    );
  }
}