import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/custom_theme/theme.dart';
import 'package:zaafer_mobile_app/config/extentions/device_utils.dart';

import 'counter_widget.dart';
import 'item_title_n_subs.dart';
import 'size_chooser_widget.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  Future<dynamic> _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const Border(),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        height: context.height / 2.2,
        width: context.width,
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  const ItemTitleNSubs(
                      title: 'Rp 450.00',
                      subtitle: 'Stok : 123',
                      titlePosition: MainAxisAlignment.end),
                  const Spacer(),
                  Align(
                    alignment: Alignment.topRight,
                    child: CloseButton(
                        onPressed: () => Navigator.pop(context),
                        style: CIconButtonThemeData.redBg.style),
                  ),
                ],
              ),
            ),
            const Gap(16),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizeChooserWidget(),
                    Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Jumlah'),
                        CounterWidget(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Gap(16),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: context.width / 2,
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Buy'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 11,
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              spreadRadius: 4,
              offset: Offset(0, 1),
            )
          ],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          color: Theme.of(context).colorScheme.background),
      child: FilledButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Buy Now')),
    );
  }
}
