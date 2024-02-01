import 'package:flutter/material.dart';

class CustomTF extends StatelessWidget {
  const CustomTF({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.isPasword,
    this.errorMessage,
    this.onChanged,
  });

  final String label, hintText;

  final bool? isPasword;
  final String? errorMessage;
  final Function(String value)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPasword ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        errorText: errorMessage,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }

        return null;
      },
    );
  }
}
