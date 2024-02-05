import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mind_ease/utils/colors.dart';

class CardDownload extends StatelessWidget {
  const CardDownload({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sorriso interior',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
              Text('24.00 MB',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87)),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.trash,
                color: ColorPalette.primary,
              ))
        ]),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          height: .5,
          color: ColorPalette.bg_input,
        )
      ],
    );
  }
}
