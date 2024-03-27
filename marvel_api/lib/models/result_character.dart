import 'package:marvel_api/models/stories.dart';

import 'comics.dart';
import 'thumbnail.dart';
import 'urls.dart';

class ResultCharacter {
  final int id;
  final String name;
  final String description;
  final String modified;
  final Thumbnail thumbnail;
  final String resourceURI;
  final Comics comics;
  final Comics series;
  final Stories stories;
  final Stories events;
  final List<Urls> urls;

  ResultCharacter(
      {required this.id,
      required this.name,
      required this.description,
      required this.modified,
      required this.thumbnail,
      required this.resourceURI,
      required this.comics,
      required this.series,
      required this.stories,
      required this.events,
      required this.urls});

  factory ResultCharacter.fromMap(Map<String, dynamic> e) {
    final thumbnail = Thumbnail.fromMap(e['thumbnail']);
    final comics = Comics.fromMap(e['comics']);
    final series = Comics.fromMap(e['series']);
    final stories = Stories.fromMap(e['stories']);
    final event = Stories.fromMap(e['events']);
    var urls = <Urls>[];
    if (e['urls'] != null) {
      e['urls'].forEach((v) {
        urls.add(new Urls.fromMap(v));
      });
    }

    return ResultCharacter(
        id: e['id'],
        name: e['name'],
        description: e['description'],
        modified: e['modified'],
        thumbnail: thumbnail,
        resourceURI: e['resourceURI'],
        comics: comics,
        series: series,
        stories: stories,
        events: event,
        urls: urls);
  }
}
