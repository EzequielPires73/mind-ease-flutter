import 'package:flutter/material.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/buttons/dropdown.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primary,
        foregroundColor: Colors.white,
        title: const Text('Favoritos'),
      ),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(child: Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24), child: Column(children: [
        Dropdown(),
        SizedBox(height: 24,),
        Dropdown(),
        SizedBox(height: 24,),
        Dropdown(),
        SizedBox(height: 24,),
      ],),)),
    );
  }
}