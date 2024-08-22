import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mind_ease/controllers/auth_controller.dart';
import 'package:mind_ease/models/collection_file.dart';
import 'package:mind_ease/services/api.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class VideoPlayerPage extends StatefulWidget {
  final CollectionFile file;
  const VideoPlayerPage({Key? key, required this.file}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late final VideoPlayerController _controller;
  late final AuthController _authController;
  Duration? currentPosition;
  Duration? duration;
  Timer? _timer;

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
    _authController = context.read<AuthController>();
    if (widget.file.path != null) {
      _controller =
          VideoPlayerController.networkUrl(Uri.parse(widget.file.path!));

      _controller.initialize().then((_) {
        setState(() {
          duration = _controller.value.duration;
        });
        _startTimer();
      });

      _controller.addListener(() {
        setState(() {
          currentPosition = _controller.value.position;
        });
      });
      //_controller.setLooping(true);
    }
  }

  void _startTimer() {
    if (_authController.user != null && _authController.accessToken != null) {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        if (_controller.value.isPlaying) {
          sendProgress(
            _authController.user!.id,
            _authController.accessToken!,
            widget.file.id,
            _controller.value.position.inSeconds.toDouble(),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
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
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
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
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
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
                max: duration != null ? duration!.inSeconds.toDouble() : 0.0,
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
    );
  }
}

Future<void> sendProgress(
    int userId, String accessToken, int fileId, double progress) async {
  try {
    final url = '${ApiService().baseUrl}user-file-progress/$fileId/progress';
    final response = await http.patch(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${accessToken.replaceAll('"', '')}',
      },
      body: jsonEncode(<String, dynamic>{
        'progress': progress,
      }),
    );
    if (response.statusCode == 200) {
      print('Progresso salvo com sucesso');
    } else {
      print('Falha ao salvar progresso');
    }
  } catch (error) {
    print('error - entrei aqui');
  }
}
