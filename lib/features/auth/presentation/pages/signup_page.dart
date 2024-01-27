import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/constants/constant.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';
import 'package:zaafer_mobile_app/core/common/custom_widgets/custom_tf/custom_tf.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              CString.signupTitle,
              style: context.headlineLarge,
            ),
            const Gap(8),
            const Text(CString.signupSubtitle),
            const Gap(32),
            const CustomTF(
              label: 'Email',
              hintText: 'yanto123@gmail.com',
            ),
            const Gap(24),
            const CustomTF(
              label: 'Password',
              hintText: 'yanto@123',
            ),
            const Gap(24),
            const CustomTF(
              label: 'Ulangi Password',
              hintText: 'yanto@123',
            ),
            const Gap(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CString.signupNav,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(onPressed: () {}, child: const Text('Masuk'))
              ],
            ),
            const Gap(32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: const Text(CString.signupTitle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
