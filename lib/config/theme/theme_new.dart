// lib/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_schemes.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColorLight,
    primaryColorLight: AppColors.secondaryColorLight,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColorLight,
      iconTheme: IconThemeData(
        color: AppColors.primaryColorLight,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.primaryColorLight,
      ),

    ),
    iconTheme: const IconThemeData(color: AppColors.primaryColorLight),
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
    //   displayColor: AppColors.textColorLight,
    //   bodyColor: AppColors.subTextColorLight,
    // ),
    
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColorLight,
      primaryContainer: AppColors.primaryColorLight,
      onPrimaryContainer: AppColors.tertiaryColorLight,

      secondary: AppColors.secondaryColorLight,
      secondaryContainer: AppColors.secondaryColorLight,
      onSecondaryContainer: AppColors.tertiaryColorLight,

      surface: AppColors.backgroundColorLight,
      error: Colors.red,
      onPrimary: AppColors.backgroundColorLight, // Texte et icônes en blanc
      //onSecondary: AppColors.text100Light,
      //onBackground: AppColors.text100Light,
      onSurface: AppColors.primaryColorLight,
      onError: AppColors.backgroundColorLight, // Texte et icônes en blanc
    ),
  );
}

// ThemeData darkThemeData(BuildContext context) {
//   return ThemeData.dark().copyWith(
//     primaryColorLight: AppColors.primary100Dark,
//     scaffoldBackgroundColor: AppColors.bg100Dark,
//     appBarTheme: const AppBarTheme(
//       backgroundColor: AppColors.primary100Dark,
//       iconTheme:
//           IconThemeData(color: AppColors.bg100Dark), // Texte et icônes en noir
//     ),
//     iconTheme: const IconThemeData(color: AppColors.text100Dark),
//     textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
//       bodyColor: AppColors.text100Dark,
//       displayColor: AppColors.text100Dark,
//     ),
//     colorScheme: const ColorScheme.dark(
//       primary: AppColors.primary100Dark,
//       primaryContainer: AppColors.primary200Dark,
//       secondary: AppColors.accent100Dark,
//       secondaryContainer: AppColors.accent200Dark,
//       //surface: AppColors.bg100Dark,
//       surface: AppColors.bg200Dark,
//       error: Colors.red,
//       onPrimary: AppColors.bg100Dark, // Texte et icônes en noir
//       onSecondary: AppColors.text100Dark,
//       //onBackground: AppColors.text100Dark,
//       onSurface: AppColors.text100Dark,
//       onError: AppColors.bg100Dark, // Texte et icônes en noir
//     ),
//   );
// }
