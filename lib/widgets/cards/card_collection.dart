import 'package:flutter/material.dart';
import 'package:mind_ease/models/collection.dart';
import 'package:mind_ease/models/collection_file.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/cards/card_collection_item.dart';

class CardCollection extends StatelessWidget {
  final Collection collection;
  final Color? color;

  const CardCollection({super.key, required this.collection, this.color});

  @override
  Widget build(BuildContext context) {
    List<CollectionFile> songs =
        collection.files?.where((e) => e.type == 'audio').toList() ?? [];
    List<CollectionFile> videos =
        collection.files?.where((e) => e.type == 'video').toList() ?? [];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton.filled(
          onPressed: () => dialogBuilder(context, collection,
              color ?? ColorPalette.primary, songs, videos),
          icon: const Icon(Icons.play_arrow_rounded),
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => color ?? ColorPalette.primary)),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: Text(
          collection.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          softWrap: true,
        ))
      ],
    );
  }
}

Future<void> dialogBuilder(
  BuildContext context,
  Collection collection,
  Color color,
  List<CollectionFile> songs,
  List<CollectionFile> videos,
) {

  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        collection.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ))
                    ],
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        TabBar(
                          labelColor: color,
                          unselectedLabelColor: Colors.black38,
                          indicatorColor: color,
                          tabs: const [
                            Tab(
                              text: 'Áudios',
                            ),
                            Tab(
                              text: 'Vídeos',
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 248,
                          child: TabBarView(children: [
                            ListView.builder(
                                itemCount: songs.length,
                                itemBuilder: (context, index) => Column(
                                      children: [
                                        CardCollectionItem(
                                          color: color,
                                          type: 'audio',
                                          file: songs[index],
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    )),
                            ListView.builder(
                                itemCount: videos.length,
                                itemBuilder: (context, index) => Column(
                                      children: [
                                        CardCollectionItem(
                                          color: color,
                                          type: 'video',
                                          file: videos[index],
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    )),
                          ]),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text(
                              'Cancelar',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
      });
}



/* Column(
                        children: [
                          TabBar(
                            labelColor: ColorPalette.primary,
                            unselectedLabelColor: Colors.black38,
                            indicatorColor: ColorPalette.primary,
                            tabs: [
                              Tab(
                                text: 'Áudios',
                              ),
                              Tab(
                                text: 'Vídeos',
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 200,
                            child: TabBarView(children: [
                              Column(children: [Text('Aúdio')]),
                              Column(children: [Text('Vídeo')]),
                            ]),
                          )
                        ],
                      ) */