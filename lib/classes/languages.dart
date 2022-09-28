import 'package:flutter/material.dart';

///  Language
///  Allows use to define Language options to be used within the application
///  ( Used within the Language Dropdown )
///  id: List id
///  flag: Flag that we want to display
///  name: Name to be displayed
///  languageCode: languageCode connected with the locale
class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  const Language(this.id, this.flag, this.name, this.languageCode);


  /// languageList
  /// Contains the current list of languages
  ///
  /// return: Current list of available languages
  static List<Language> languageList() {
    return <Language>[
      const Language(1, "🇨🇦", "English", "en"),
      const Language(2, "🇫🇷", "French", "fr"),
    ];
  }

  /// getLanguageByLanguageCode
  /// Grab the language from the languageCode
  ///
  /// return: New language from languageCode
  static Language getLanguageByLanguageCode(String lang) {
    switch (lang) {
      case "en":
        return const Language(1, "🇨🇦", "English", "en");
      case "fr":
        return const Language(2, "🇫🇷", "French", "fr");
      default:
        return const Language(3, "🏴‍☠️", "null", "null");
    }
  }
}