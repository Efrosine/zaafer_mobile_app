import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/extentions/device_utils.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';
import 'package:zaafer_mobile_app/core/common/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:zaafer_mobile_app/features/shop/domain/entities/user_entity.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = const UserEntity(
      name: 'fajar',
      username: null,
      phoneNumber: null,
      gender: null,
      birthday: null,
    );

    Map<int, String> property = {
      0: 'Name',
      1: 'Username',
      2: 'Phone Number',
      3: 'Gender',
      4: 'Birthday',
    };

    var listData = data.toList();

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: CustomAppBar(
        height: 90,
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
        title: const Text('Profile'),
        action: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.red,
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Jerome Bell',
                        style: context.titleLarge,
                      ),
                      Text(
                        '(603) 555-0123',
                        style: context.bodySmall,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),

                      // alignment: Alignment.bottomRight,
                      child: Row(
                        children: [
                          Text('Edit Profile',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              )),
                          Icon(
                            Icons.edit_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(height: 24),
            Text(
              'Info Profile',
              style: context.headlineSmall,
            ),
            const Gap(12),
            Form(
              key: _formKey,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: <int, TableColumnWidth>{
                  0: FixedColumnWidth(context.width / 3),
                },
                children: property.entries.map((entry) {
                  return TableRow(
                    children: [
                      Text(entry.value),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: TextFormField(
                          enabled: true,
                          decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              isDense: true,
                              hintText: 'Input ${entry.value}'),
                          initialValue: listData[entry.key],
                          onSaved: (newValue) => listData[entry.key] = newValue,
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
            const Gap(24),
            if (true)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton.tonal(onPressed: () {}, child: const Text('Batal')),
                  const Gap(12),
                  FilledButton(onPressed: () {}, child: const Text('Simpan')),
                ],
              )
          ],
        ),
      ),
    );
  }
}
