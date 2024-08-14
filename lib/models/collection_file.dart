class CollectionFile {
  int id;
  String type;
  String name;
  String? description;
  String? path;
  int? size;
  String? thumbnailPath;

  CollectionFile({
    required this.id,
    required this.name,
    required this.type,
    this.description,
    this.path,
    this.size,
    this.thumbnailPath,
  });

  factory CollectionFile.fromJson(Map<String, dynamic> json) {
    return CollectionFile(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      path: json['path'] != null ? 'https://api.mindease.elevechurch.com.br/${json['path']}' : null,
      thumbnailPath: json['thumbnail_path'] != null ? 'https://api.mindease.elevechurch.com.br/${json['thumbnail_path']}' : null,
    );
  }
}
