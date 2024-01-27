import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/constants/constant.dart';
import 'package:zaafer_mobile_app/config/extentions/device_utils.dart';

class ItemTitleNSubs extends StatelessWidget {
  const ItemTitleNSubs({
    super.key,
    required this.title,
    required this.subtitle,
    required this.titlePosition,
  });

  final String subtitle;
  final String title;
  final MainAxisAlignment titlePosition;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
          dimension: context.width / 3.2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red,
            ),
          ),
        ),
        const Gap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: titlePosition,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  color: CColor.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            ),
            Text(subtitle)
          ],
        ),
      ],
    );
  }
}
