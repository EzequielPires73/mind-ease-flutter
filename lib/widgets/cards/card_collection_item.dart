import 'package:flutter/material.dart';
import 'package:mind_ease/models/collection_file.dart';
import 'package:mind_ease/screens/audio_player.dart';
import 'package:mind_ease/screens/video_player.dart';
import 'package:mind_ease/utils/colors.dart';

class CardCollectionItem extends StatelessWidget {
  final Color? color;
  final String type;
  final CollectionFile file;
  const CardCollectionItem({super.key, required this.type, required this.file, this.color,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => type == 'audio' ? AudioPlayerPage(file: file,) : VideoPlayerPage(file: file,)));
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
                  Text(file.name,
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
