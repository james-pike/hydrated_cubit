import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// AppLocalizations
/// Allows us to load in language json files depending on the current locale
/// defined by the app or the device.
///
/// Locale locale: Current locale to load
class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  late Map<String, dynamic> _localizedValues;

  /// load()
  /// Load the json file strings into _localizedValues
  /// This allows us to have separate files for each language
  ///
  Future load() async {
    String jsonStringValues =
        await rootBundle.loadString('lib/languages/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _localizedValues = mappedJson.map((key, value) {
      return MapEntry(key, value); //not value.toString() so the value will be a map
    });
  }
  /// getTranslatedValue
  /// Allows us to grab the local text from
  ///
  /// String key: key to access the local string
  /// return: Translated value
  String getTranslatedValue(String key) {
    // Return key if the value doesn't exist within the json
    var nestedMap = _getNestedValue(key);
    return nestedMap.toString();
  }

  /// _getNestedValue
  ///
  /// String keyPath: Path to break down to get to value
  /// return: Dynamic value that contains our string
  dynamic _getNestedValue(String keyPath) {
    Map keyMap = keyPath.split('.').asMap();
    var nestedMap;
    keyMap.forEach((index, key) {
      if (index == 0) {
        nestedMap = _localizedValues[key];
      } else {
        nestedMap = nestedMap[key];
      }
    });
    return nestedMap;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
}

/// _DemoLocalizationsDelegate
/// Create a language delegation to pass to the parent
///
/// Extends LocalizationsDelegate
/// https://api.flutter.dev/flutter/widgets/LocalizationsDelegate-class.html
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

  const _AppLocalizationsDelegate();

  @override
  /// isSupported
  /// Check whether we should load the locale within the delegate
  ///
  /// Locale locale: Current locale
  /// return: Whether the language is support or not in the application
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);


  @override
  /// load
  /// Loads the json file into the AppLocalizations object and returns it
  ///
  /// Locale locale: Current locale
  /// return: App localization with loaded local key-pairs
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localization = AppLocalizations(locale);
    await localization.load();
    return localization;
  }

  @override
  /// shouldReload
  /// Whether resources for the given locale can be loaded by this delegate.
  ///
  /// _AppLocalizationsDelegate old: Old AppLocalDelegate
  ///
  /// return: Whether it should reload or not
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}