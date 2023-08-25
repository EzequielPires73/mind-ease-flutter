import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String value;
  const TextTitle({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(
          color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}
