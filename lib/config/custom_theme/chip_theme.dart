import 'package:flutter/material.dart';

import '../constants/constant.dart';

class CChipTheme {
  CChipTheme._();

  static ChipThemeData lighTheme = const ChipThemeData().copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      selectedColor: CColor.primaryThin);
}
