import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldPrimary extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final bool? required;
  final List<TextInputFormatter>? formatter;

  const TextFieldPrimary({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.required,
    this.formatter
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (required == true && (value == '' || value == null)) {
          return 'Preencha um valor';
        }
      },
      controller: controller,
      inputFormatters: formatter,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
          ),
          label: Text(label),
          border: const OutlineInputBorder()),
    );
  }
}
