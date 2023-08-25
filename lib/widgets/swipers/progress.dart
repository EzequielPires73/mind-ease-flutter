import 'package:flutter/material.dart';
import 'package:new_app/models/data.dart';
import 'package:new_app/widgets/cards/card_progress.dart';

class SwiperProgress extends StatelessWidget {
  const SwiperProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories[0].subcategories!.length,
            itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0 ? const EdgeInsets.symmetric(horizontal: 16) : const EdgeInsets.only(right: 16),
                  child: CardProgress(
                      progress: (10 * (index + 1)) / 100,
                      subcategory: categories[0].subcategories![index]),
                );
            },
          ),
        )
      ],
    );
  }
}
