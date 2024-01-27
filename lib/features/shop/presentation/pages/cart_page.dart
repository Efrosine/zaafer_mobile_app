import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/core/common/custom_widgets/custom_appbar/custom_appbar.dart';

import '../../../../config/constants/constant.dart';
import '../widgets/cart_list_tile.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBar(
          height: 120,
          title: Text('Kerangjang'),
          padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              CustomTab(label: 'Tiba Ditujuan'),
              CustomTab(label: 'Dikirim'),
              CustomTab(label: 'Diproses'),
              CustomTab(label: 'Menunggu Konfirmasi'),
            ],
          ),
        ),
        body: TabBarView(children: [
          CartTibaTujuan(),
          Center(child: Text('Dikirim')),
          Center(child: Text('Diproses')),
          Center(child: Text('Menunggu Konfirmasi')),
        ]),
      ),
    );
  }
}

class CartTibaTujuan extends StatelessWidget {
  const CartTibaTujuan({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: 2,
      itemBuilder: (context, index) {
        return const CartListTile();
      },
      separatorBuilder: (context, index) {
        return const Gap(12);
      },
    );
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: CColor.grey, width: 1)),
          child: Align(alignment: Alignment.center, child: Text(label))),
    );
  }
}
