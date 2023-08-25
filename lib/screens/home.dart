import 'package:flutter/material.dart';
import 'package:new_app/models/data.dart';
import 'package:new_app/utils/colors.dart';
import 'package:new_app/widgets/cards/card_subcategory.dart';
import 'package:new_app/widgets/headers/default.dart';
import 'package:new_app/widgets/swipers/categories.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        const Header(),
        Container(
            transform: Matrix4.translationValues(0, -16, 0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                SwiperCategories(index: 0),
                SizedBox(
                  height: 24,
                ),
                SwiperCategories(index: 1),
                SizedBox(
                  height: 24,
                ),
                SwiperCategories(index: 2),
                SizedBox(
                  height: 24,
                ),
                SwiperCategories(index: 3),
              ],
            )),
      ]),
    ));
  }
}
