import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/constants/constant.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';
import 'package:zaafer_mobile_app/core/common/custom_widgets/custom_tf/custom_tf.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
              CString.signinTitle,
              style: context.headlineLarge,
            ),
            const Gap(8),
            const Text(CString.signinSubtitle),
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
            const Gap(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CString.signinNav,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(onPressed: () {}, child: const Text('Daftar'))
              ],
            ),
            const Gap(32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                // style: FilledButton.styleFrom(textStyle: TextStyle()),
                child: const Text(CString.signinTitle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
