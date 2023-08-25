import 'package:flutter/material.dart';

class TextFieldPrimary extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  const TextFieldPrimary({super.key, required this.controller, required this.label, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
        label: Text(label), border: const OutlineInputBorder()),
    );
  }
}
