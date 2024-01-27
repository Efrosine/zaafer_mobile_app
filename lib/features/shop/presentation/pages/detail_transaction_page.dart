import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/features/shop/presentation/widgets/item_title_n_subs.dart';

import '../../../../core/common/custom_widgets/custom_appbar/custom_appbar.dart';

class DetailTransactionPage extends StatelessWidget {
  const DetailTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 75,
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        style: const CustomAppBarStyle().copyWith(titlePosition: TitlePosition.center),
        title: const Text('Detail Transaksi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black),
              ),
              child: const IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ItemTitleNSubs(
                        title: 'Koko Basic',
                        subtitle: 'Rp 450.000',
                        titlePosition: MainAxisAlignment.start),
                    Spacer(),
                    Chip(
                      visualDensity: VisualDensity.compact,
                      label: Text('4.9'),
                      avatar: Icon(Icons.star),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black),
              ),
              child: Table(
                children: const [
                  TableRow(
                    children: [
                      Text('Subtotal'),
                      Text(
                        'Rp 100.000',
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Jumlah'),
                      Text(
                        '2x',
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Subtotal'),
                      Text(
                        'Rp 200.000',
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Gap(24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: const Text('Terima Pesanan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
