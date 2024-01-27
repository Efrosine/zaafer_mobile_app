import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/constants/constant.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';
import 'custom_appbar_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.action,
    this.padding,
    this.style,
    this.height = kToolbarHeight,
    this.bottom,
  });

  final List<Widget>? action;
  final Widget? bottom;
  final double height;
  final Widget? leading;
  final EdgeInsets? padding;
  final CustomAppBarStyle? style;
  final Widget? subtitle;
  final Widget? title;

  @override
  Size get preferredSize => Size.fromHeight(height);

  Widget setWidget(Widget? widget) {
    return widget ?? const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              setWidget(leading),
              if (leading != null) const Gap(8),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      style?.titlePosition!.position ?? TitlePosition.start.position,
                  children: [
                    DefaultTextStyle(
                      style: style?.titleTextStyle ?? context.headlineSmall!,
                      child: setWidget(title),
                    ),
                    DefaultTextStyle(
                      style: style?.subtitleTextStyle ?? context.bodyLarge!,
                      child: setWidget(subtitle),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: action ?? [],
              ),
            ],
          ),
          if (bottom != null) const Gap(8),
          setWidget(bottom),
        ],
      ),
    );
  }
}
