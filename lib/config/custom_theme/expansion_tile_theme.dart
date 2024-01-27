import 'package:flutter/material.dart';

class CExpansionTileTheme {
  CExpansionTileTheme._();

  static ExpansionTileThemeData lighTheme = const ExpansionTileThemeData().copyWith(
    expandedAlignment: Alignment.centerLeft,
    childrenPadding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: Colors.black),
    ),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: Colors.black),
    ),
  );
}
