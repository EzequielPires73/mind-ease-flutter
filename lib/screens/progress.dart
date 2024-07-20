import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/cards/card_progress_primary.dart';
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
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
                      child: const Column(children: [
                        TextTitle(value: 'Seu progresso'),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            CardProgressPrimary(
                                image: 'assets/icons/meditation.svg',
                                title: 'Minutos meditando',
                                value: '36'),
                            CardProgressPrimary(
                                image: 'assets/icons/congratulations.svg',
                                title: 'Meditações concluídas',
                                value: '1'),
                            CardProgressPrimary(
                                image: 'assets/icons/clock.svg',
                                title: 'Minutos em média',
                                value: '12'),
                          ],
                        )
                      ]),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextTitle(value: 'Coleções iniciadas'),
                  ),
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
