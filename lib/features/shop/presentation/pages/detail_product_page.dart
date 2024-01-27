import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';
import 'package:zaafer_mobile_app/core/common/custom_widgets/custom_appbar/custom_appbar.dart';

import '../widgets/custom_bottom_sheet.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 100,
        padding: const EdgeInsets.all(24),
        style: const CustomAppBarStyle().copyWith(
            titlePosition: TitlePosition.end, subtitleTextStyle: context.bodyMedium),
        title: const Text('Green Jubah'),
        subtitle: const Text('More information about this clothes'),
        leading: IconButton.filled(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      bottomSheet: const CustomBottomSheet(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Gap(16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Green Jubah',
                      style: context.titleLarge,
                    ),
                    const Text('Rp 450.000'),
                  ],
                ),
                const Spacer(),
                const Chip(
                  label: Text('4.9'),
                  avatar: Icon(Icons.star),
                )
              ],
            ),
            const Gap(16),
            const Text(
              'ini text bakal panjang banget sampai sampai layar kaca hp tidak muan untuk menampung kalimat ini dalam saatu baris'
              'ini text bakal panjang banget sampai sampai layar kaca hp tidak muan untuk menampung kalimat ini dalam saatu baris',
            ),
            const Gap(24),
            const ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              title: Text('Detail'),
              children: [
                Divider(),
                Text('Panjang*Lebar\n\n'
                    'M = 71 cm x 49 cm\n'
                    'L = 73 cm x 51 cm\n'
                    'XL = 75 cm x 53 cm\n'
                    'XXL = 77 cm x 55 cm'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
