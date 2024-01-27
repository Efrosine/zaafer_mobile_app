import 'package:flutter/material.dart';

class CInputDecorationTheme {
  CInputDecorationTheme._();

  static InputDecorationTheme lightTheme = const InputDecorationTheme().copyWith(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    floatingLabelBehavior: FloatingLabelBehavior.always,
  );
}
