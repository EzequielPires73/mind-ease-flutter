import 'package:flutter/material.dart';
import 'package:new_app/models/collection.dart';
import 'package:new_app/utils/colors.dart';
import 'package:new_app/widgets/cards/card_collection_item.dart';

class CardCollection extends StatelessWidget {
  final Collection collection;
  final Color? color;

  const CardCollection({super.key, required this.collection, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton.filled(
          onPressed: () =>
              dialogBuilder(context, collection, color ?? ColorPalette.primary),
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
    BuildContext context, Collection collection, Color color) {
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
                                itemCount: 5,
                                itemBuilder: (context, index) => Column(
                                      children: [
                                        CardCollectionItem(color: color, type: 'audio'),
                                        const SizedBox(height: 8),
                                      ],
                                    )),
                            ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) => Column(
                                      children: [
                                        CardCollectionItem(color: color, type: 'video',),
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