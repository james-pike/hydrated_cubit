import 'dart:ui'; // for mobile
import 'package:csp/classes/state/settings/settings_cubit.dart';
import 'package:csp/classes/state/settings/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main.dart';
import '../classes/languages.dart';
import 'package:flutter/material.dart';
import 'package:csp/components/bottom_nav.dart';
import '../localization/language_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPreferences extends StatefulWidget {
  const SettingsPreferences({Key? key}) : super(key: key);

  @override
  _SettingsPreferencesState createState() => _SettingsPreferencesState();
}

class _SettingsPreferencesState extends State<SettingsPreferences> {
  Language? selectedLanguage;

  /// _changeLanguage
  /// Sets the app language and saves it for app reload using share preference
  ///
  /// Language language: Current language to set within the app/share preference
  ///
  void _changeLanguage(Language? language) async {
    setLocale(language?.languageCode ?? 'en');
    Locale locale = await getLocale();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(USER_SET_LANG, language?.languageCode ?? "");

    MyApp.setLocale(context, locale);
  }

  /// getUserLanguage
  /// When reloading the application, we need to check the share preferences
  /// to see if the user has a stored language
  ///
  void _getUserLanguage() async {
    Locale deviceLocale = window.locale;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = await prefs.getString(USER_SET_LANG) ?? "";

    if (languageCode != "") {
      setState(() {
        selectedLanguage = Language.getLanguageByLanguageCode(languageCode);
      });
    } else {
      setState(() {
        selectedLanguage = Language.getLanguageByLanguageCode(deviceLocale.languageCode);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                SwitchListTile(
                  title: Text(
                      getTranslated(context, "pages.settings.notifications")),
                  value: state.notifications,
                  onChanged: (bool value) {
                    context.read<SettingsCubit>().toggleNotifications();
                  },
                  secondary: const Icon(Icons.notifications_active_outlined),
                  tileColor: Colors.white,
                ),
                SwitchListTile(
                  title:
                  Text(getTranslated(context, "pages.settings.messaging")),
                  value: context.read<SettingsCubit>().state.messages,
                  onChanged: (bool value) {
                    context.read<SettingsCubit>().toggleMessages();
                  },
                  secondary: const Icon(Icons.message_outlined),
                  tileColor: Colors.white,
                ),
                SwitchListTile(
                  title: Text(
                      getTranslated(context, "pages.settings.walkietalkie")),
                  value: context.read<SettingsCubit>().state.walkietalkie,
                  onChanged: (bool value) {
                    context.read<SettingsCubit>().toggleWalkieTalkie();
                  },
                  secondary: const Icon(Icons.phone_in_talk_outlined),
                  tileColor: Colors.white,
                ),

                SwitchListTile(
                  title:
                  Text(getTranslated(context, "pages.settings.pingalerts")),
                  value: context.read<SettingsCubit>().state.pingalerts,
                  onChanged: (bool value) {
                    context.read<SettingsCubit>().togglePingAlerts();
                  },
                  secondary: const Icon(Icons.add_alert_outlined),
                  tileColor: Colors.white,
                ),
                SwitchListTile(
                  title: Text(getTranslated(context, "pages.settings.theme")),
                  value: context.read<SettingsCubit>().state.theme,
                  subtitle: Text(
                      getTranslated(context, "pages.settings.themesubtitle")),
                  onChanged: (bool value) async {
                    context.read<SettingsCubit>().toggleTheme();
                  },
                  secondary: const Icon(Icons.palette_outlined),
                  tileColor: Colors.white,
                ),
                SwitchListTile(
                  title:
                  Text(getTranslated(context, "pages.settings.language")),
                  value: context.read<SettingsCubit>().state.language,
                  subtitle: Text(getTranslated(
                      context, "pages.settings.languagesubtitle")),
                  onChanged: (bool value) {
                    context.read<SettingsCubit>().toggleLanguage();
                    value == true
                        ? _changeLanguage(
                        Language.getLanguageByLanguageCode("fr"))
                        : _changeLanguage(
                        Language.getLanguageByLanguageCode("en"));
                  },
                  secondary: const Icon(Icons.language_rounded),
                  tileColor: Colors.white,
                ),
                const SizedBox(height: 20),
              ],
            )),
        bottomNavigationBar: const BottomNavigation(),
      );
    }
    );
  }
}
