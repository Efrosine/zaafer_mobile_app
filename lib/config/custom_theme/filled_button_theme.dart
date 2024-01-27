import 'package:flutter/material.dart';

class CFilledButtonTheme {
  CFilledButtonTheme._();

  static FilledButtonThemeData lighTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      textStyle:
          const TextStyle().copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.25),
    ),
  );
}
