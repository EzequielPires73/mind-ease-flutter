import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mind_ease/models/collection_file.dart';

class AudioPlayerPage extends StatefulWidget {
  final CollectionFile file;
  const AudioPlayerPage({Key? key, required this.file}) : super(key: key);

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  bool isPlaying = false;
  double value = 0;
  late final CollectionFile file;
  final AudioPlayer player = AudioPlayer();
  Duration? duration = const Duration(seconds: 0);

  void initPlayer() async {
    await player.setSource(UrlSource(file.path!));
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
    file = widget.file;
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
        title: Text(file.name),
        backgroundColor: const Color(0XFF15AAAB),
      ),
      body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(file.thumbnailPath!),
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
                child: Image.network(file.thumbnailPath!,
                    width: 250, height: 250, fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                file.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                file.description!,
                style: const TextStyle(
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
                    style: const TextStyle(color: Colors.white),
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
                        await player.seek(Duration(seconds: newValue.toInt()));
                        await player.resume();
                      },
                      onChangeEnd: (newValue) async {
                        setState(() {
                          value = newValue;
                        });
                        player.pause();
                        await player.seek(Duration(seconds: newValue.toInt()));
                        await player.resume();
                      },
                      activeColor: Colors.white,
                      inactiveColor: Colors.white70.withOpacity(.2)),
                  Text(
                    "${duration!.inMinutes < 10 ? "0${duration!.inMinutes}" : duration!.inMinutes}:${(duration!.inSeconds % 60) < 10 ? "0${duration!.inSeconds % 60}" : duration!.inSeconds % 60}",
                    style: const TextStyle(color: Colors.white),
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
                      border: Border.all(color: Colors.white.withOpacity(.5))),
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
    );
  }
}
