import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/profil/profil_screen.dart';
import '../core/constants/sizes.dart';
import '../core/constants/text_strings.dart';
import '../core/util/screen_size.dart';
import 'bloc/cubit/settings_toggle_button_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsToggleButtonCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeUtil.spacing(5),
              vertical: SizeUtil.spacing(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tSettingTitle,
                  style: TextStyle(
                    fontSize: SizeUtil.textSize(sTitleSpace),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: sSectionSpace),
                Text(
                  "Général",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: SizeUtil.textSize(4.5),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSettingRow(
                  icon: Icons.person,
                  title: "Profil utilisateur",
                  subtitle: "Modifier les informations du profil",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilScreen()),
                    );
                  },
                ),
                _buildSettingRow(
                  icon: Icons.settings,
                  title: "Paramètre de l'application",
                  subtitle: "Modifier les paramètres généraux de l'application",
                ),
                const SizedBox(height: sSectionSpace),
                Text(
                  "Langue",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: SizeUtil.textSize(4),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSettingRow(
                  icon: Icons.language,
                  title: "Langue",
                  subtitle: "Changer la langue de l'application",
                ),
                const SizedBox(height: sSectionSpace),
                Text(
                  "Thème",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: SizeUtil.textSize(4),
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<SettingsToggleButtonCubit,
                    SettingsToggleButtonState>(
                  builder: (context, state) {
                    return _buildSettingRow(
                      icon: Icons.brightness_6_outlined,
                      title: "Mode Sombre",
                      subtitle: "Activer/Désactiver le mode sombre",
                      isSwitch: true,
                      value: state.darkMode,
                      onChanged: (value) {
                        context
                            .read<SettingsToggleButtonCubit>()
                            .toggleDarkMode();
                      },
                      switchOnColor: const Color(0xFFF5F5F5),
                      switchOffColor: Colors.transparent,
                      switchBorderColor: const Color(0xFFFF6600),
                    );
                  },
                ),
                const SizedBox(height: sSectionSpace),
                Text(
                  "Notifications",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: SizeUtil.textSize(4),
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<SettingsToggleButtonCubit,
                    SettingsToggleButtonState>(
                  builder: (context, state) {
                    return _buildSettingRow(
                      icon: Icons.notifications,
                      title: "Notifications push",
                      subtitle: "Gérer les notifications push",
                      isSwitch: true,
                      value: state.notificationsEnabled,
                      onChanged: (value) {
                        context
                            .read<SettingsToggleButtonCubit>()
                            .toggleNotifications();
                      },
                      switchOnColor: const Color(0xFFF5F5F5),
                      switchOffColor: Colors.grey,
                      switchBorderColor: const Color(0xFFFF6600),
                      buttonColor: Colors.white,
                    );
                  },
                ),
                const SizedBox(height: sSectionSpace),
                Text(
                  "Sécurité",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: SizeUtil.textSize(4),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSettingRow(
                  icon: Icons.lock,
                  title: "Changer le mot de passe",
                  subtitle: "Modifier votre mot de passe",
                ),
                BlocBuilder<SettingsToggleButtonCubit,
                    SettingsToggleButtonState>(
                  builder: (context, state) {
                    return _buildSettingRow(
                      icon: Icons.security,
                      title: "Authentification à deux facteurs",
                      subtitle:
                          "Activer/Désactiver l'authentification à deux facteurs",
                      isSwitch: true,
                      value: state.twoFactorAuthEnabled,
                      onChanged: (value) {
                        context
                            .read<SettingsToggleButtonCubit>()
                            .toggleTwoFactorAuth();
                      },
                      switchOnColor: const Color(0xFFF5F5F5),
                      switchOffColor: Colors.grey,
                      switchBorderColor: const Color(0xFFFF6600),
                      buttonColor: Colors.white,
                    );
                  },
                ),
                const SizedBox(height: sSectionSpace),
                
                const Text(
                  "Aide",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                _buildSettingRow(
                  icon: Icons.info,
                  title: "A propos de l'application",
                  subtitle: "Information sur l'application et la version",
                ),
                _buildSettingRow(
                  icon: Icons.privacy_tip,
                  title: "Politique de confidentialité",
                  subtitle: "Voir la politique de confidentialité",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//   Widget _buildSettingRow({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     bool isSwitch = false,
//     bool value = false,
//     ValueChanged<bool>? onChanged,
//     Color switchOnColor = Colors.transparent,
//     Color switchOffColor = Colors.transparent,
//     Color switchBorderColor = Colors.transparent,
//     Color buttonColor = Colors.transparent,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Container(
//                 height: SizeUtil.heightPercentage(6.5),
//                 width: SizeUtil.widthPercentage(11),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF5F5F5),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Icon(
//                   icon,
//                   color: const Color(0xFF444648),
//                 ),
//               ),
//               SizedBox(width: SizeUtil.iconSize(3)),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       color: const Color(0xFF1D1F21),
//                       fontSize: SizeUtil.textSize(3.5),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     width: SizeUtil.widthPercentage(60),
//                     child: Text(
//                       subtitle,
//                       style: const TextStyle(
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           if (isSwitch)
//             Switch(
//               value: value,
//               onChanged: onChanged,
//               activeColor: switchOnColor,
//               inactiveThumbColor: const Color(0xFF444648),
//               inactiveTrackColor: const Color(0xFFF5F5F5),
//               activeTrackColor: switchBorderColor,
//             ),
//         ],
//       ),
//     );
//   }
// }

  Widget _buildSettingRow({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isSwitch = false,
    bool value = false,
    ValueChanged<bool>? onChanged,
    Color switchOnColor = Colors.transparent,
    Color switchOffColor = Colors.transparent,
    Color switchBorderColor = Colors.transparent,
    Color buttonColor = Colors.transparent,
    VoidCallback? onTap, // Nouveau paramètre pour la fonction de navigation
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: SizeUtil.heightPercentage(6.5),
                  width: SizeUtil.widthPercentage(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFF444648),
                  ),
                ),
                SizedBox(width: SizeUtil.iconSize(3)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFF1D1F21),
                        fontSize: SizeUtil.textSize(3.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: SizeUtil.widthPercentage(60),
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (isSwitch)
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: switchOnColor,
                inactiveThumbColor: const Color(0xFF444648),
                inactiveTrackColor: const Color(0xFFF5F5F5),
                activeTrackColor: switchBorderColor,
              )
            else
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}
