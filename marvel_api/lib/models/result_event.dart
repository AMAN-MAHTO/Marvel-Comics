import 'package:marvel_api/models/items2.dart';
import 'package:marvel_api/models/list_type1.dart';
import 'package:marvel_api/models/list_type2.dart';
import 'package:marvel_api/models/thumbnail.dart';
import 'package:marvel_api/models/urls.dart';

class ResultEvent {
  final int? id;
  final String? title;
  final String? description;
  final String? resourceURI;
  final List<Urls>? urls;
  final String? modified;
  final String? start;
  final String? end;
  final Thumbnail? thumbnail;
  final ListType2? creators;
  final ListType1? characters;
  final ListType2? stories;
  final ListType1? comics;
  final ListType1? series;
  final Items2? next;
  final Items2? previous;

  ResultEvent(
      {required this.id,
      required this.title,
      required this.description,
      required this.resourceURI,
      required this.urls,
      required this.modified,
      required this.start,
      required this.end,
      required this.thumbnail,
      required this.creators,
      required this.characters,
      required this.stories,
      required this.comics,
      required this.series,
      required this.next,
      required this.previous});

  factory ResultEvent.fromMap(Map<String, dynamic> json) {
    var id = json['id'];
    var title = json['title'];
    var description = json['description'];
    var resourceURI = json['resourceURI'];
    var urls = <Urls>[];
    if (json['urls'] != null) {
      json['urls'].forEach((v) {
        urls!.add(new Urls.fromMap(v));
      });
    }
    var modified = json['modified'];
    var start = json['start'];
    var end = json['end'];
    var thumbnail = json['thumbnail'] == null? null:Thumbnail.fromMap(json['thumbnail']);
    var creators = json['creators'] == null? null:ListType2.fromMap(json['creators']);
    var characters = json['characters'] == null? null:ListType1.fromMap(json['characters']);
    var stories = json['stories'] == null? null:ListType2.fromMap(json['stories']);
    var comics = json['comics'] == null? null:ListType1.fromMap(json['comics']);
    var series = json['series'] == null? null:ListType1.fromMap(json['series']);
    var next = json['next'] == null? null:Items2.fromMap(json['next']);
    var previous = json['previous'] == null? null:Items2.fromMap(json['previous']);

    return ResultEvent(
        id: id,
        title: title,
        description: description,
        resourceURI: resourceURI,
        urls: urls,
        modified: modified,
        start: start,
        end: end,
        thumbnail: thumbnail,
        creators: creators,
        characters: characters,
        stories: stories,
        comics: comics,
        series: series,
        next: next,
        previous: previous);
  }

  get name => null;
}
