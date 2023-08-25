import 'package:new_app/models/song.dart';
import 'package:new_app/models/video.dart';

class Collection {
  int id;
  String name;
  List<Song>? songs;
  List<Video>? videos;

  Collection({required this.id, required this.name, this.songs, this.videos});
}