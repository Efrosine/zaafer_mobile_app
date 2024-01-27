import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaafer_mobile_app/config/constants/constant.dart';
import 'package:zaafer_mobile_app/config/custom_theme/theme.dart';

import '../../core/common/custom_widgets/custom_appbar/custom_appbar_style.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
    ),
    textTheme: GoogleFonts.plusJakartaSansTextTheme(),
  );

  static ThemeData lighTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: CColor.primary,
      brightness: Brightness.light,
    ),
    textTheme: CTextTheme.lightTheme,
    chipTheme: CChipTheme.lighTheme,
    expansionTileTheme: CExpansionTileTheme.lighTheme,
    inputDecorationTheme: CInputDecorationTheme.lightTheme,
    iconButtonTheme: CIconButtonThemeData.lightTheme,
    navigationBarTheme: CNavigationBarThemeData.lightTheme,
    filledButtonTheme: CFilledButtonTheme.lighTheme,
    tabBarTheme: CTabBarTheme.lighTheme,
    extensions: <ThemeExtension<dynamic>>[
      CustomAppBarStyle(
        titlePosition: TitlePosition.center,
        titleTextStyle: CTextTheme.lightTheme.headlineSmall!,
        subtitleTextStyle: CTextTheme.lightTheme.bodyMedium!,
      ),
    ],
  );
}
