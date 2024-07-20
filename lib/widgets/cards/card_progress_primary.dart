import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_ease/utils/colors.dart';

class CardProgressPrimary extends StatelessWidget {
  final String image;
  final String title;
  final String value;

  const CardProgressPrimary(
      {super.key,
      required this.image,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset(
            image,
            height: 56,
            width: 56,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                color: ColorPalette.primary,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
