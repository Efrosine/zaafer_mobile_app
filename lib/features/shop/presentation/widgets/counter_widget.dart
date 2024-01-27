import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/custom_theme/theme.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove),
            style: CIconButtonThemeData.noBg.style),
        const Gap(8),
        const Text('12'),
        const Gap(8),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            style: CIconButtonThemeData.noBg.style),
      ],
    );
  }
}
