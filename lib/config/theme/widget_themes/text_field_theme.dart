import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightThemeDecorationTheme =
       InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIconColor: Colors.black,
        suffixIconColor: Colors.black,
        floatingLabelStyle: const TextStyle(color: Colors.black),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.black,
          ),
        ),
      );

  static InputDecorationTheme darkThemeDecorationTheme =
      const InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: Colors.white,
        floatingLabelStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.white,
          ),
        ),
      );
}
