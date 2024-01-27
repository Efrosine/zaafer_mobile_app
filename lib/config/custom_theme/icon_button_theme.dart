import 'package:flutter/material.dart';

class CIconButtonThemeData {
  CIconButtonThemeData._();

  static IconButtonThemeData lightTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: const Color(0xFF5B6671),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static IconButtonThemeData noBg = IconButtonThemeData(
    style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF5B6671),
        visualDensity: VisualDensity.compact,
        iconSize: 18),
  );

  static IconButtonThemeData redBg = IconButtonThemeData(
    style: IconButton.styleFrom(
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        visualDensity: VisualDensity.compact,
        iconSize: 18),
  );
}
