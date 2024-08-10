part of 'settings_toggle_button_cubit.dart';

sealed class SettingsToggleButtonState extends Equatable {
  final bool darkMode;
  final bool notificationsEnabled;
  final bool twoFactorAuthEnabled;

  const SettingsToggleButtonState({
    required this.darkMode,
    required this.notificationsEnabled,
    required this.twoFactorAuthEnabled,
  });

  @override
  List<Object> get props => [darkMode, notificationsEnabled, twoFactorAuthEnabled];
}

final class SettingsToggleButtonInitial extends SettingsToggleButtonState {
  const SettingsToggleButtonInitial()
      : super(darkMode: false, notificationsEnabled: false, twoFactorAuthEnabled: false);
}

final class SettingsToggleButtonUpdated extends SettingsToggleButtonState {
  const SettingsToggleButtonUpdated({
    required super.darkMode,
    required super.notificationsEnabled,
    required super.twoFactorAuthEnabled,
  });
}
