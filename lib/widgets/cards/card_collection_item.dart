import 'package:flutter/material.dart';
import 'package:new_app/screens/audio_player.dart';
import 'package:new_app/screens/video_player.dart';
import 'package:new_app/utils/colors.dart';

class CardCollectionItem extends StatelessWidget {
  final Color? color;
  final String type;
  const CardCollectionItem({super.key, required this.type, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => type == 'audio' ? const AudioPlayerPage() : const VideoPlayerPage()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 48,
            decoration: BoxDecoration(
                color: color ?? ColorPalette.primary,
                borderRadius: BorderRadius.circular(6)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(type == 'audio' ? 'Audio 10 min' : 'Vídeo 10 min',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                  const Row(
                    children: [
                      Text(
                        'Tocar',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      )
                    ],
                  )
                ]),
          )),
    );
  }
}
