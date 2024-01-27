import 'package:flutter/material.dart';

class CustomTF extends StatelessWidget {
  const CustomTF({
    super.key,
    required this.label,
    required this.hintText,
  });

  final String label, hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
      ),
    );
  }
}
