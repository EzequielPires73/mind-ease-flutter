import 'package:mind_ease/models/subcategory.dart';

class Category {
  int id;
  String name;
  String? slug;
  String? image;
  List<Subcategory>? subcategories;

  Category({
    required this.name,
    required this.id,
    this.slug,
    this.image,
    this.subcategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var results = json['subcategories'] as List;
    List<Subcategory> subcategories =
        results.map((json) => Subcategory.fromJson(json)).toList();

    return Category(
      name: json['name'],
      id: json['id'],
      slug: json['slug'],
      subcategories: subcategories
    );
  }
}
