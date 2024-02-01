import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/extentions/device_utils.dart';

import '../../domain/entities/user_entity.dart';

class UserDataentryWidget extends StatelessWidget {
  const UserDataentryWidget({
    super.key,
    required this.isEditing,
    this.data,
    this.onSaved,
  });

  final bool isEditing;
  final UserEntity? data;
  final Function()? onSaved;

  @override
  Widget build(BuildContext context) {
    Map<int, String> properties = {
      0: 'Name',
      1: 'Username',
      2: 'Phone Number',
      3: 'Gender',
      4: 'Birthday',
    };

    var listData = data?.toList() ?? UserEntity.empty().toList();
    var globalKey = GlobalKey<FormState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Form(
          key: globalKey,
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: <int, TableColumnWidth>{
              0: FixedColumnWidth(context.width / 3),
            },
            children: properties.entries.map((property) {
              return TableRow(
                children: [
                  Text(property.value),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      enabled: isEditing,
                      decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          isDense: true,
                          hintText: 'Input ${property.value}'),
                      initialValue: listData[property.key],
                      onSaved: (newValue) => listData[property.key] = newValue,
                      textAlign: isEditing ? TextAlign.start : TextAlign.end,
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        ),
        if (isEditing) ...[
          const Gap(24),
          FilledButton(onPressed: onSaved, child: const Text('Simpan'))
        ]
      ],
    );
  }
}
