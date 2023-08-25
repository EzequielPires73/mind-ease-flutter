import 'package:new_app/models/collection.dart';

class Subcategory {
  int id;
  String name;
  String image;
  List<Collection>? collections;

  Subcategory({required this.id, required this.name, required this.image, this.collections});
}