import 'package:flutter/material.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
      {super.key, required this.title, required this.subtitle, this.width, this.child});

  final String subtitle;
  final String title;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: SizedBox(
          width: width,
          child: LayoutBuilder(builder: (context, constraint) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.fromSize(
                  size: Size.fromHeight(constraint.maxWidth),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.red,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  dense: true,
                  title: Text(title, style: context.titleMedium),
                  subtitle: Text(subtitle, style: context.bodySmall),
                ),
                if (child != null) ...[child!],
              ],
            );
          }),
        ),
      ),
    );
  }
}
