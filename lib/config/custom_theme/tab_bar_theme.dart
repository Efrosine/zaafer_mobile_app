import 'package:flutter/material.dart';
import 'package:zaafer_mobile_app/config/constants/constant.dart';

class CTabBarTheme {
  CTabBarTheme._();

  static TabBarTheme lighTheme = const TabBarTheme().copyWith(
    dividerHeight: 0,
    dividerColor: Colors.red,
    indicator: BoxDecoration(
      color: CColor.accent,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: CColor.accentDark, width: 1),
    ),
    indicatorSize: TabBarIndicatorSize.label,
    tabAlignment: TabAlignment.start,
    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
    labelStyle: const TextStyle(color: CColor.accentDark, fontWeight: FontWeight.w500),
    unselectedLabelStyle:
        const TextStyle(color: CColor.grey, fontWeight: FontWeight.w500),
  );
}
