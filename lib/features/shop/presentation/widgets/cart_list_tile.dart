import 'package:flutter/material.dart';

import '../../../../config/constants/constant.dart';

class CartListTile extends StatelessWidget {
  const CartListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: CColor.grey, width: 1)),
        child: Column(
          children: [
            ListTile(
              dense: true,
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text('Barang'),
              subtitle: const Text('16 Mei 2023'),
              trailing: Container(
                decoration: BoxDecoration(
                    color: CColor.accent, borderRadius: BorderRadius.circular(8)),
                child: const Text('Berhasil'),
              ),
            ),
            const Divider(color: CColor.grey),
            ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                leading: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                title: const Text('Modern Koko'),
                subtitle: const Text('1 Barang'),
                trailing: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Total belanja'), Text('Rp 150.000')],
                )),
          ],
        ),
      ),
    );
  }
}
