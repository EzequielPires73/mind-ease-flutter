import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/headers/progress.dart';
import 'package:mind_ease/widgets/swipers/progress.dart';
import 'package:mind_ease/widgets/typografy/title.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(children: [
          HeaderProgress(),
          Expanded(
              child: Container(
            transform: Matrix4.translationValues(0, -16, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: List.filled(
                          1,
                          const BoxShadow(
                              blurRadius: 8, color: Colors.black12)),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(children: [
                    const TextTitle(value: 'Seu progresso'),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/meditation.svg',
                                height: 56,
                                width: 56,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Minutos meditando',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                '36',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorPalette.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/congratulations.svg',
                                height: 56,
                                width: 56,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Meditações concluídas',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                '1',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorPalette.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/clock.svg',
                                height: 56,
                                width: 56,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Minutos em média',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                '12',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorPalette.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: TextTitle(value: 'Coleções iniciadas'),),
              const SizedBox(
                height: 8,
              ),
              const SwiperProgress()
            ]),
          ))
        ]),
      ),
    );
  }
}
