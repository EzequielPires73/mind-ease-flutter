import 'package:flutter/material.dart';
import 'package:mind_ease/models/collection_file.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final CollectionFile file;
  const VideoPlayerPage({Key? key, required this.file}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late final VideoPlayerController _controller;
  Duration? currentPosition;
  Duration? duration;

  String formatDuration(Duration? duration) {
    if (duration == null) return '';

    String hours = duration.inHours.remainder(24).toString().padLeft(2, '0');
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }

  @override
  void initState() {
    super.initState();
    if (widget.file.path != null) {
      _controller =
          VideoPlayerController.networkUrl(Uri.parse(widget.file.path!));

      _controller.initialize().then((_) => setState(() {
            duration = _controller.value.duration;
          }));
      _controller.addListener(() {
        setState(() {
          currentPosition = _controller.value.position;
        });
      });
      _controller.setLooping(true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Diminuir o Stress'),
        backgroundColor: const Color(0XFF15AAAB),
      ),
      body: Center(
        child: Column(
          children: [
            _controller.value.isInitialized
                ? Expanded(
                    child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ))
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    backgroundColor: ColorPalette.forest,
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(formatDuration(currentPosition)),
                  Expanded(
                    child: Slider(
                      value: currentPosition != null
                          ? currentPosition!.inSeconds.toDouble()
                          : 0.0,
                      min: 0.0,
                      max: duration != null
                          ? duration!.inSeconds.toDouble()
                          : 0.0,
                      onChanged: (value) {
                        setState(() {
                          currentPosition = Duration(seconds: value.toInt());
                          _controller.seekTo(Duration(seconds: value.toInt()));
                        });
                      },
                      activeColor: ColorPalette.forest,
                      inactiveColor: ColorPalette.forest.withOpacity(.2),
                    ),
                  ),
                  Text(formatDuration(duration)),
                ],
              ),
            ),
          ],
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        backgroundColor: ColorPalette.forest,
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), */
    );
  }
}
