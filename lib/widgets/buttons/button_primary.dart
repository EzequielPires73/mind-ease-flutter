import 'package:flutter/material.dart';
import 'package:mind_ease/screens/home.dart';
import 'package:mind_ease/utils/colors.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;

  const ButtonPrimary(
      {super.key,
      required this.onPressed,
      required this.title,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Opacity(
        opacity: isLoading == true ? 0.5 : 1,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => ColorPalette.primary),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
          onPressed: isLoading == true ? null : onPressed,
          child: isLoading == true
              ? const CircularProgressIndicator()
              : Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }
}
