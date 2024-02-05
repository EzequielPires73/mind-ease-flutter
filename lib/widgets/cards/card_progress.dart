import 'package:flutter/material.dart';
import 'package:mind_ease/models/subcategory.dart';
import 'package:mind_ease/screens/category_view.dart';
import 'package:mind_ease/utils/colors.dart';

class CardProgress extends StatelessWidget {
  final Subcategory subcategory;
  final double progress;
  final Color? color;

  const CardProgress(
      {super.key,
      required this.subcategory,
      required this.progress,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryView(
                      subcategory: subcategory,
                      color: color,
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
            height: 183,
            width: 160,
            decoration: BoxDecoration(
              color: ColorPalette.primary,
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
                    Image.asset(
                      subcategory.image,
                      filterQuality: FilterQuality.high,
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subcategory.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Row(mainAxisSize: MainAxisSize.max, children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: LinearProgressIndicator(
                                    value: progress,
                                    minHeight: 8,
                                    backgroundColor: Colors.white,
                                    valueColor: const AlwaysStoppedAnimation(
                                        ColorPalette.primary_dark))),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${(progress * 100)}%',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                    ))
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
