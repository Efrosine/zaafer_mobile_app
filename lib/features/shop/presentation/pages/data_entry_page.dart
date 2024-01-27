import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';
import 'package:zaafer_mobile_app/core/common/custom_widgets/custom_tf/custom_tf.dart';

class DataEntryPage extends StatelessWidget {
  const DataEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Info Profile',
              style: context.headlineLarge,
            ),
            const Gap(32),
            const CustomTF(
              label: 'Nama',
              hintText: 'Yanto',
            ),
            const Gap(24),
            const CustomTF(
              label: 'Username',
              hintText: 'yanto123',
            ),
            const Gap(24),
            const CustomTF(
              label: 'Nomor Telepon',
              hintText: '081234567890',
            ),
            const Gap(24),
            const CustomTF(
              label: 'Tanggal Lahir',
              hintText: '23/12/2002',
            ),
            const Gap(32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
