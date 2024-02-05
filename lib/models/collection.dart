import 'package:mind_ease/models/collection_file.dart';
import 'package:mind_ease/models/song.dart';
import 'package:mind_ease/models/video.dart';

class Collection {
  int id;
  String name;
  List<CollectionFile>? files;


  Collection({required this.id, required this.name, this.files});

  factory Collection.fromJson(Map<String, dynamic> json) {
    var results = json['files'] as List<dynamic>;
    List<CollectionFile> files =
        results.map((json) => CollectionFile.fromJson(json)).toList();

    return Collection(
      id: json['id'],
      name: json['name'],
      files: files
    );
  }
}
