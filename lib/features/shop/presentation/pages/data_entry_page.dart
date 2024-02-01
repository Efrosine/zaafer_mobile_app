import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';
import 'package:zaafer_mobile_app/features/shop/presentation/widgets/user_dataentry_widget.dart';

class DataEntryPage extends StatelessWidget {
  const DataEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 100, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Info Profile',
              style: context.headlineLarge,
            ),
            const Gap(32),
            UserDataentryWidget(
              isEditing: true,
              onSaved: () {},
            ),
          ],
        ),
      ),
    );
  }
}
