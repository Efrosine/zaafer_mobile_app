import 'package:flutter/material.dart';

class CColor {
  static const Color accent = Color(0xFF9DE07C);
  static const Color accentDark = Color(0xFF25570F);
  static const Color black = Color(0xFF17191C);
  static const LinearGradient customGradient = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.6),
      Color.fromRGBO(182, 182, 182, 0.6),
      Color.fromRGBO(80, 80, 80, 0.6),
      Color.fromRGBO(21, 21, 21, 0.6),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: [0.1, 0.2, 0.6, 0.7],
  );

  static const Color grey = Color(0xFF5B6671);
  static const Color negative = Color(0xFFE01E1E);
  static const Color positive = Color(0xFF378316);
  static const Color primary = Color(0xFFAE9B1E);
  static const Color primaryThin = Color.fromARGB(255, 226, 212, 122);
}
