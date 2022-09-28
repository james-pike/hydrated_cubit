import 'package:flutter/material.dart';
import 'package:csp/localization/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LANGUAGE_CODE = 'languageCode';
const String USER_SET_LANG = "userSetLanguage";

//languages code
const String english = 'en';
const String french = 'fr';

/// setLocale
/// Sets the langaugeCode in sharedPreference
///
/// String languageCode: Stores the languageCode for later use
///
void setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(LANGUAGE_CODE, languageCode);
}

/// setLocale
/// Gets the langaugeCode in the sharedPreference
///
/// return Locale tied to the languageCode
Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(LANGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

/// _locale
/// Returns the Locales associated to the languageCode
///
/// String languageCode Language code to convert into Locale
///
/// return new Locale tied with languageCode
Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, 'CA');
    case french:
      return const Locale(french, "CA");
    default:
      return const Locale(english, 'CA');
  }
}

/// getTranslated
/// Converts the key into the associated locale value
///
/// BuildContext context: Current context
/// String key: Current key to translate
///
/// return: Value connected with the key
String getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context).getTranslatedValue(key);
}