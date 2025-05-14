import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final InputBorder? border;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.border = const OutlineInputBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText, border: border),
    );
  }
}
