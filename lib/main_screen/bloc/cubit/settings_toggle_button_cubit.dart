import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_toggle_button_state.dart';

class SettingsToggleButtonCubit extends Cubit<SettingsToggleButtonState> {
  SettingsToggleButtonCubit() : super(const SettingsToggleButtonInitial());

  void toggleDarkMode() {
    emit(SettingsToggleButtonUpdated(
      darkMode: !state.darkMode,
      notificationsEnabled: state.notificationsEnabled,
      twoFactorAuthEnabled: state.twoFactorAuthEnabled,
    ));
  }

  void toggleNotifications() {
    emit(SettingsToggleButtonUpdated(
      darkMode: state.darkMode,
      notificationsEnabled: !state.notificationsEnabled,
      twoFactorAuthEnabled: state.twoFactorAuthEnabled,
    ));
  }

  void toggleTwoFactorAuth() {
    emit(SettingsToggleButtonUpdated(
      darkMode: state.darkMode,
      notificationsEnabled: state.notificationsEnabled,
      twoFactorAuthEnabled: !state.twoFactorAuthEnabled,
    ));
  }
}