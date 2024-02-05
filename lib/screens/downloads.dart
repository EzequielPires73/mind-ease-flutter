import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/cards/card_download.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primary,
        foregroundColor: Colors.white,
        title: const Text('Meus downloads'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: const Column(children: [
          CardDownload(),
          CardDownload(),
          CardDownload(),
          CardDownload(),
          CardDownload(),
        ]),
      )),
    );
  }
}
