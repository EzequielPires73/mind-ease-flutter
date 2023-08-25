import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({Key? key}) : super(key: key);

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  bool isPlaying = false;
  double value = 0;
  final AudioPlayer player = AudioPlayer();
  Duration? duration = const Duration(seconds: 0);

  void initPlayer() async {
    await player.setSource(AssetSource('forest.mp3'));
    var d = await player.getDuration();
    player.onPlayerComplete.listen((event) {
      resetValues();
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        duration = d;
        isPlaying = false;
        value = 0.0;
      });
    });
  }

  void resetValues() async {
    await player.setSource(AssetSource('forest.mp3'));
    var d = await player.getDuration();
    setState(() {
      duration = d;
      isPlaying = false;
      value = 0.0;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Diminuir o Stress'),
        backgroundColor: const Color(0XFF15AAAB),
      ),
      body: Container(
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/vetores-gratis/desenho-plano-desenhado-a-mao-paisagem-montanhosa_23-2149158786.jpg?w=1380&t=st=1688849952~exp=1688850552~hmac=2f82b4437bd6d1c1f58552d33898013073796c331dffd7fbea72a493befa2381"),
                        fit: BoxFit.cover),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
                    child: Container(
                      color: Colors.black54,
                    ),
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                      'https://img.freepik.com/vetores-gratis/desenho-plano-desenhado-a-mao-paisagem-montanhosa_23-2149158786.jpg?w=1380&t=st=1688849952~exp=1688850552~hmac=2f82b4437bd6d1c1f58552d33898013073796c331dffd7fbea72a493befa2381',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Floresta - Música Ambiente Relaxante",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Lost World",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${(value / 60).floor() < 10 ? "0${(value / 60).floor()}" : (value / 60).floor()}:${(value % 60).floor() < 10 ? "0${(value % 60).floor()}" : (value % 60).floor()}",
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                        min: 0.0,
                        max: duration!.inSeconds.toDouble(),
                        value: value,
                        onChanged: (newValue) async {
                          setState(() {
                            value = newValue;
                          });
                          player.pause();
                          await player
                              .seek(Duration(seconds: newValue.toInt()));
                          await player.resume();
                        },
                        onChangeEnd: (newValue) async {
                          setState(() {
                            value = newValue;
                          });
                          player.pause();
                          await player
                              .seek(Duration(seconds: newValue.toInt()));
                          await player.resume();
                        },
                        activeColor: Colors.white,
                        inactiveColor: Colors.white70.withOpacity(.2)),
                    Text(
                      "${duration!.inMinutes < 10 ? "0${duration!.inMinutes}" : duration!.inMinutes}:${(duration!.inSeconds % 60) < 10 ? "0${duration!.inSeconds % 60}" : duration!.inSeconds % 60}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 36,
                ),
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.black87,
                        border:
                            Border.all(color: Colors.white.withOpacity(.5))),
                    child: InkWell(
                      onTap: () async {
                        if (isPlaying) {
                          player.pause();
                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          await player.resume();
                          player.onPositionChanged.listen((position) {
                            setState(() {
                              value = position.inSeconds.toDouble();
                            });
                          });
                          setState(() {
                            isPlaying = true;
                          });
                        }
                      },
                      child: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
