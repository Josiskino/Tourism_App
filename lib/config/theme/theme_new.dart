// lib/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_schemes.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: AppColors.primary100Light,
    scaffoldBackgroundColor: AppColors.bg100Light,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary100Light,
      iconTheme: IconThemeData(color: AppColors.bg100Light), // Texte et icônes en blanc
    ),
    iconTheme: const IconThemeData(color: AppColors.text100Light),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
      bodyColor: AppColors.text100Light,
      displayColor: AppColors.text100Light,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary100Light,
      primaryContainer: AppColors.primary200Light,
      secondary: AppColors.accent100Light,
      secondaryContainer: AppColors.accent200Light,
      //background: AppColors.bg100Light,
      surface: AppColors.bg200Light,
      error: Colors.red,
      onPrimary: AppColors.bg100Light, // Texte et icônes en blanc
      onSecondary: AppColors.text100Light,
      //onBackground: AppColors.text100Light,
      onSurface: AppColors.text100Light,
      onError: AppColors.bg100Light, // Texte et icônes en blanc
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: AppColors.primary100Dark,
    scaffoldBackgroundColor: AppColors.bg100Dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary100Dark,
      iconTheme: IconThemeData(color: AppColors.bg100Dark), // Texte et icônes en noir
    ),
    iconTheme: const IconThemeData(color: AppColors.text100Dark),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
      bodyColor: AppColors.text100Dark,
      displayColor: AppColors.text100Dark,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary100Dark,
      primaryContainer: AppColors.primary200Dark,
      secondary: AppColors.accent100Dark,
      secondaryContainer: AppColors.accent200Dark,
      //surface: AppColors.bg100Dark,
      surface: AppColors.bg200Dark,
      error: Colors.red,
      onPrimary: AppColors.bg100Dark, // Texte et icônes en noir
      onSecondary: AppColors.text100Dark,
      //onBackground: AppColors.text100Dark,
      onSurface: AppColors.text100Dark,
      onError: AppColors.bg100Dark, // Texte et icônes en noir
    ),
  );
}
