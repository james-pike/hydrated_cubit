import 'package:flutter/material.dart';
import '../localization/language_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          const SizedBox(height: 100.0),
          Column(
            children: <Widget>[
              Image.asset('assets/logo.jpg'),
            ],
          ),
          const SizedBox(height: 60.0),
          TextField(
            controller: username,
            decoration: InputDecoration(
              filled: true,
              labelText: getTranslated(context, "pages.login.username"),
            ),
          ),
          const SizedBox(height: 12.0),
          TextField(
            controller: password,
            decoration: InputDecoration(
              filled: true,
              labelText: getTranslated(context, "pages.login.password"),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 45.0),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
              ),
              child: Text(getTranslated(context, "pages.login.login_button"))
          ),
          TextButton(
              onPressed: () {
                username.clear();
                password.clear();
              },
              style: TextButton.styleFrom(
                primary: Colors.red[900],
              ),
              child: Text(getTranslated(context, "pages.login.not_a_member"))
          ),
        ],
      ),
    );
  }
}
