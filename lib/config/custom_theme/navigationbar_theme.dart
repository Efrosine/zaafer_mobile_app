import 'package:flutter/material.dart';

class CNavigationBarThemeData {
  CNavigationBarThemeData._();

  static NavigationBarThemeData lightTheme = const NavigationBarThemeData().copyWith(
    backgroundColor: Colors.white,
    iconTheme: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? const IconThemeData().copyWith(color: Colors.black)
          : const IconThemeData().copyWith(color: Colors.grey),
    ),
    labelTextStyle: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? const TextStyle().copyWith(color: Colors.black)
          : const TextStyle().copyWith(color: Colors.grey),
    ),
  );
}
