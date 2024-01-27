import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:zaafer_mobile_app/core/common/custom_widgets/custom_appbar/custom_appbar_widget.dart';

import 'package:zaafer_mobile_app/features/shop/presentation/widgets/product_tile.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        height: 70,
        padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
        title: Text('Wishlist'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Cari Barang',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const Gap(24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) => ProductTile(
                title: 'Barang $index',
                subtitle: 'Rp. ${index + 1}00 000',
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Beli Barang'), Gap(4), Icon(Icons.arrow_forward)]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
