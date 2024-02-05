import 'package:flutter/material.dart';
import 'package:mind_ease/models/category.dart';
import 'package:mind_ease/models/subcategory.dart';
import 'package:mind_ease/screens/category_view.dart';
import 'package:mind_ease/utils/colors.dart';

class CardCategory extends StatelessWidget {
  final Subcategory subcategory;
  final Color? color;
  final bool? filled;

  const CardCategory(
      {super.key, required this.subcategory, this.color, this.filled});

  @override
  Widget build(BuildContext context) {
    if (filled == true) {
      double screenWidth = MediaQuery.of(context).size.width;

      return ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryView(
                            subcategory: subcategory,
                            color: color,
                          )));
            },
            child: Container(
                constraints: const BoxConstraints(maxHeight: 116),
                width: screenWidth - 32,
                decoration: BoxDecoration(
                  color: color ?? ColorPalette.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: -50,
                        right: -25,
                        child: Transform.rotate(
                          angle: 45 * 0.0174533,
                          child: Container(
                            width: 30,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.2),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        )),
                    Positioned(
                        top: -5,
                        left: -5,
                        child: Transform.rotate(
                          angle: 45 * 0.0174533,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.2),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        )),
                    Positioned(
                        bottom: -5,
                        right: -5,
                        child: Transform.rotate(
                          angle: 45 * 0.0174533,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.2),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        )),
                    Positioned(
                        bottom: -10,
                        left: -10,
                        child: Transform.rotate(
                          angle: 45 * 0.0174533,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.2),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            subcategory.image,
                            filterQuality: FilterQuality.high,
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  subcategory.name,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                const Text(
                                  '5 seções',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ));
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CategoryView(
                          subcategory: subcategory,
                          color: color,
                        )));
          },
          child: Container(
              height: 183,
              width: 160,
              decoration: BoxDecoration(
                color: color ?? ColorPalette.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Stack(children: [
                Positioned(
                    top: -50,
                    right: -25,
                    child: Transform.rotate(
                      angle: 45 * 0.0174533,
                      child: Container(
                        width: 30,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.2),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )),
                Positioned(
                    top: -5,
                    left: -5,
                    child: Transform.rotate(
                      angle: 45 * 0.0174533,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.2),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )),
                Positioned(
                    bottom: -5,
                    right: -5,
                    child: Transform.rotate(
                      angle: 45 * 0.0174533,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.2),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )),
                Positioned(
                    bottom: -10,
                    left: -10,
                    child: Transform.rotate(
                      angle: 45 * 0.0174533,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.2),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Image.network(
                        subcategory.image,
                        filterQuality: FilterQuality.high,
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        subcategory.name,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.bottomCenter,
                        child: const Text(
                          '5 seções',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ))
                    ],
                  ),
                )
              ])),
        ),
      );
    }
  }
}
