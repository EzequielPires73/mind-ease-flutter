import 'package:flutter/material.dart';
import 'package:mind_ease/models/category.dart';
import 'package:mind_ease/models/data.dart';
import 'package:mind_ease/models/subcategory.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/cards/card_subcategory.dart';
import 'package:mind_ease/widgets/typografy/title.dart';

class SwiperCategories extends StatelessWidget {
  final int index;
  final Category category;
  const SwiperCategories({super.key, required this.category, required this.index});

  Color findColor() {
    Color? color;

    switch (index) {
      case 0:
        color = ColorPalette.primary;
        break;
      case 1:
        color = ColorPalette.bg_yellow;
        break;
      case 2:
        color = ColorPalette.bg_blue;
        break;
      case 3:
        color = ColorPalette.bg_red;
        break;
    }

    return color ?? ColorPalette.primary;
  }

  @override
  Widget build(BuildContext context) {
    List<Subcategory>? subcategories = category.subcategories;

    if (subcategories == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextTitle(
            value: category.name,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        subcategories.length > 1
            ? SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: subcategories.length,
                  itemBuilder: (context, index_) {
                    if (index_ == 0) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CardCategory(
                            subcategory: subcategories[index_],
                            color: findColor(),
                            filled: subcategories.length > 1 ? false : true,
                          ));
                    } else {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: CardCategory(
                            subcategory: subcategories[index_],
                            color: findColor(),
                          ));
                    }
                  },
                ))
            : SizedBox(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CardCategory(
                      subcategory: subcategories[0],
                      color: findColor(),
                      filled: subcategories.length > 1 ? false : true,
                    ))),
      ],
    );
  }
}
