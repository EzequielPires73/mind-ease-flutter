import 'package:mind_ease/models/collection.dart';

class Subcategory {
  int id;
  String name;
  String image;
  List<Collection>? collections;

  Subcategory({
    required this.id,
    required this.name,
    required this.image,
    this.collections,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    var results = json['collections'] as List;
    List<Collection> collections =
        results.map((json) => Collection.fromJson(json)).toList();

    return Subcategory(
      id: json['id'],
      name: json['name'],
      image: 'http://192.168.0.21:8080/${json['image']}',
      collections: collections
    );
  }
}
