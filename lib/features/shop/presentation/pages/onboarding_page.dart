import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/extentions/device_utils.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';

import '../../../../config/constants/constant.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -150,
            right: -110,
            height: context.height + 400,
            width: context.width + 200,
            child: Image.asset(
              CImageUrl.onboardingBg,
              alignment: Alignment.centerLeft,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: context.height,
            width: context.width,
            decoration: const BoxDecoration(gradient: CColor.customGradient),
          ),
          Positioned(
            top: context.height * 0.25,
            left: 24,
            right: 100,
            child: Column(
              children: [
                Text(
                  CString.onboardingTitle,
                  style: context.headlineLarge,
                ),
                const Gap(20),
                Text(
                  CString.onboardingSubtitle,
                  style: context.bodyLarge,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: context.height * 0.15,
              left: 24,
              right: 24,
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(backgroundColor: CColor.primary),
                        child: const Text('Masuk'),
                      )),
                  const Gap(8),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.tonal(
                      onPressed: () {},
                      child: const Text('Daftar'),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
