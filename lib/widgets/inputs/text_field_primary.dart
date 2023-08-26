import 'package:flutter/material.dart';

class TextFieldPrimary extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final bool? required;

  const TextFieldPrimary({super.key, required this.controller, required this.label, this.obscureText = false, this.required});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(required == true && (value == '' || value == null)) {
          return 'Preencha um valor';
        }
      },
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
        label: Text(label), border: const OutlineInputBorder()),
    );
  }
}
