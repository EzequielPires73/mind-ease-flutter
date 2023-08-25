import 'package:flutter/material.dart';
import 'package:new_app/models/category.dart';
import 'package:new_app/models/data.dart';
import 'package:new_app/models/subcategory.dart';
import 'package:new_app/utils/colors.dart';
import 'package:new_app/widgets/cards/card_subcategory.dart';
import 'package:new_app/widgets/typografy/title.dart';

class SwiperCategories extends StatelessWidget {
  final int index;
  const SwiperCategories({super.key, required this.index});

  String findTitle(int index) {
    String title = '';

    switch (index) {
      case 0:
        title = 'Destaques';
        break;
      case 1:
        title = 'Técnicas de respiração';
        break;
      case 2:
        title = 'Sons para dormir';
        break;
      case 3:
        title = 'Técnicas de Mindfulness';
        break;
    }

    return title;
  }

  Color findColor(int index) {
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
    Category category = categories[index];
    List<Subcategory>? subcategories = categories[index].subcategories;

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
                            color: findColor(index),
                            filled: subcategories.length > 1 ? false : true,
                          ));
                    } else {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: CardCategory(
                            subcategory: subcategories[index_],
                            color: findColor(index),
                          ));
                    }
                  },
                ))
            : SizedBox(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CardCategory(
                      subcategory: subcategories[0],
                      color: findColor(index),
                      filled: subcategories.length > 1 ? false : true,
                    ))),
      ],
    );
  }
}
