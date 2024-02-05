import 'package:flutter/material.dart';
import 'package:mind_ease/models/category.dart';
import 'package:mind_ease/models/subcategory.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/cards/card_collection.dart';

class CategoryView extends StatefulWidget {
  final Subcategory subcategory;
  final Color? color;

  const CategoryView({super.key, required this.subcategory, this.color});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late Subcategory subcategory;

  @override
  void initState() {
    super.initState();
    subcategory = widget.subcategory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        foregroundColor: Colors.white,
        title: Text(
          subcategory.name,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: widget.color ?? ColorPalette.primary,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: subcategory.collections?.length,
              itemBuilder: (context, index) => Column(
                children: [
                  const SizedBox(height: 16,),
                  CardCollection(collection: subcategory.collections![index], color: widget.color,)
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
