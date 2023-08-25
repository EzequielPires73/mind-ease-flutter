import 'package:flutter/material.dart';
import 'package:new_app/screens/home.dart';
import 'package:new_app/utils/colors.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonPrimary({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => ColorPalette.primary),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)))),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
