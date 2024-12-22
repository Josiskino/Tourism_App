import 'package:flutter/material.dart';

import '../color_schemes.dart';



class TAppBarTheme {
  TAppBarTheme._();
  
  static AppBarTheme lightThemeAppBarTheme = const AppBarTheme(
    backgroundColor: AppColors.backgroundColorLight,
      iconTheme: IconThemeData(
        color: AppColors.primaryColorLight,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.primaryColorLight,
      ),
  );
}