import 'package:flutter/material.dart';

class CustomTF extends StatelessWidget {
  const CustomTF({
    super.key,
    required this.label,
    required this.hintText,
    this.isPasword,
    this.onChanged,
    this.validator,
  });

  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final String label, hintText;
  final bool? isPasword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isPasword ?? false,
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
