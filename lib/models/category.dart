import 'package:new_app/models/subcategory.dart';

class Category {
  int id;
  String name;
  String? image;
  List<Subcategory>? subcategories;

  Category({required this.name, required this.id, this.image, this.subcategories});
}
