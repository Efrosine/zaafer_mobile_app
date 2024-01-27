import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SizeChooserWidget extends StatelessWidget {
  const SizeChooserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size'),
        Gap(8),
        Wrap(
          spacing: 8,
          children: [
            ChoiceChip(label: Text('M'), selected: false),
            ChoiceChip(label: Text('L'), selected: true),
            ChoiceChip(label: Text('XL'), selected: false),
            ChoiceChip(label: Text('XXL'), selected: false),
          ],
        ),
      ],
    );
  }
}
