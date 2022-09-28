import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {

  final bool notifications;
  final bool messages;
  final bool walkietalkie;
  final bool pingalerts;
  final bool theme;
  final bool language;

  const SettingsState({
    this.notifications = true,
    this.messages = false,
    this.walkietalkie = false,
    this.pingalerts = false,
    this.theme = false,
    this.language = false,
  });

  SettingsState copyWith({
    bool? notifications,
    bool? messages,
    bool? walkietalkie,
    bool? pingalerts,
    bool? theme,
    bool? language,
  }) {
    return SettingsState(
      notifications: notifications ?? this.notifications,
      messages: messages ?? this.messages,
      walkietalkie: walkietalkie ?? this.walkietalkie,
      pingalerts: pingalerts ?? this.pingalerts,
      theme: theme ?? this.theme,
      language: language ?? this.language,
    );
  }

  @override
  List<Object?> get props =>
      [notifications, messages, walkietalkie, pingalerts, theme, language];
}