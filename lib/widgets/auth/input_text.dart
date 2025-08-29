import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool obscureText;

  const InputText({super.key, required this.text, required this.obscureText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) => value!.isEmpty ? "Enter password" : null,
    );
  }
}
