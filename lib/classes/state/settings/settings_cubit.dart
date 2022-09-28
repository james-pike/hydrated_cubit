import 'package:csp/classes/state/settings/settings_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void toggleNotifications() {
    emit(state.copyWith(notifications: !state.notifications));
  }

  void toggleMessages() {
    emit(state.copyWith(messages: !state.messages));
  }

  void toggleWalkieTalkie() {
    emit(state.copyWith(walkietalkie: !state.walkietalkie));
  }

  void togglePingAlerts() {
    emit(state.copyWith(pingalerts: !state.pingalerts));
  }

  void toggleTheme() {
    emit(state.copyWith(theme: !state.theme));
  }

  void toggleLanguage() {
    emit(state.copyWith(language: !state.language));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) => json['value'] as SettingsState;

  @override
  Map<String, SettingsState> toJson(SettingsState state) => {'value': state};
}