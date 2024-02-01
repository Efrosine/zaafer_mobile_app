import 'package:flutter/material.dart';
import 'package:zaafer_mobile_app/config/constants/constant.dart';

class CustomAppBarStyle extends ThemeExtension<CustomAppBarStyle> {
  const CustomAppBarStyle({
    this.subtitleTextStyle,
    this.titleTextStyle,
    this.titlePosition,
  });

  final TextStyle? subtitleTextStyle;
  final TitlePosition? titlePosition;
  final TextStyle? titleTextStyle;

  @override
  CustomAppBarStyle copyWith({
    TextStyle? subtitleTextStyle,
    TitlePosition? titlePosition,
    TextStyle? titleTextStyle,
  }) {
    return CustomAppBarStyle(
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      titlePosition: titlePosition ?? this.titlePosition,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  ThemeExtension<CustomAppBarStyle> lerp(
      covariant ThemeExtension<CustomAppBarStyle>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
