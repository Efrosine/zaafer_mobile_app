import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CTextTheme {
  CTextTheme._();

  static TextTheme lightTheme = GoogleFonts.plusJakartaSansTextTheme().copyWith(
    headlineLarge: const TextStyle().copyWith(fontWeight: FontWeight.w700),
    headlineSmall: const TextStyle().copyWith(fontWeight: FontWeight.w700),
    titleLarge: const TextStyle().copyWith(fontWeight: FontWeight.w500),
  );
  static TextTheme darkTextTheme = GoogleFonts.plusJakartaSansTextTheme();
}
