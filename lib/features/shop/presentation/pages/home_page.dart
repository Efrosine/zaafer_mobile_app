import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/constants/constant.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';
import 'package:zaafer_mobile_app/core/common/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:zaafer_mobile_app/features/shop/presentation/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 110,
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        title: const Text(CString.brandName),
        subtitle: const Text(CString.brandJargon),
        action: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const Gap(16),
            SizedBox.fromSize(
              size: const Size.fromHeight(170),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red,
                ),
              ),
            ),
            const Gap(24),
            Text('Category', style: context.titleLarge),
            const Gap(16),
            const Row(
              children: [
                Expanded(
                  child: ProductTile(
                    title: 'Jubah',
                    subtitle: 'Shop Now',
                  ),
                ),
                Gap(16),
                Expanded(
                  child: ProductTile(
                    title: 'Koko',
                    subtitle: 'Shop Now',
                  ),
                ),
              ],
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('New Arivals', style: context.titleLarge),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text('View All'),
                      Gap(4),
                      Icon(Icons.arrow_forward_ios, size: 14)
                    ],
                  ),
                )
              ],
            ),
            const Gap(16),
            SizedBox.fromSize(
              size: const Size.fromHeight(200),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (context, index) => const Gap(8),
                itemBuilder: (context, index) => ProductTile(
                  width: 120,
                  title: 'Barang $index',
                  subtitle: 'Rp.500.000',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
