import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final InputBorder? border;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.border = const OutlineInputBorder(),
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText, border: border),
    );
  }
}
