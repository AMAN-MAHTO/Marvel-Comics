import 'package:marvel_api/models/items2.dart';
import 'package:marvel_api/models/list_type1.dart';
import 'package:marvel_api/models/list_type2.dart';
import 'package:marvel_api/models/thumbnail.dart';
import 'package:marvel_api/models/urls.dart';

class ResultCreator {
  final int? id;
  final String? title;
  final String? description;
  final String? resourceURI;
  final List<Urls>? urls;
  final int? startYear;
  final int? endYear;
  final String? rating;
  final String? type;
  final String? modified;
  final Thumbnail? thumbnail;
  final ListType2? creators;
  final ListType2? characters;
  final ListType2? stories;
  final ListType1? comics;
  final ListType2? events;
  final Items2? next;
  final Items2? previous;

  ResultCreator(
      {required this.id,
      required this.title,
      required this.description,
      required this.resourceURI,
      required this.urls,
      required this.startYear,
      required this.endYear,
      required this.rating,
      required this.type,
      required this.modified,
      required this.thumbnail,
      required this.creators,
      required this.characters,
      required this.stories,
      required this.comics,
      required this.events,
      required this.next,
      required this.previous});

  factory ResultCreator.fromMap(Map<String, dynamic> json) {
    var urls = <Urls>[];
    if (json['urls'] != null) {
      json['urls'].forEach((v) {
        urls!.add(new Urls.fromMap(v));
      });
    }
    var next = json['next'] == null ? null : Items2.fromMap(json['next']);
    var previous =
        json['previous'] == null ? null : Items2.fromMap(json['previous']);
    var thumbnail =
        json['thumbnail'] == null ? null : Thumbnail.fromMap(json['thumbnail']);
    var creators =
        json['creators'] == null ? null : ListType2.fromMap(json['creators']);
    var characters = json['characters'] == null
        ? null
        : ListType2.fromMap(json['characters']);
    var stories =
        json['stories'] == null ? null : ListType2.fromMap(json['stories']);
    var comics =
        json['comics'] == null ? null : ListType1.fromMap(json['comics']);
    var events =
        json['events'] == null ? null : ListType2.fromMap(json['events']);

    return ResultCreator(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        resourceURI: json['resourceURI'],
        urls: urls,
        startYear: json['startYear'],
        endYear: json['endYear'],
        rating: json['rating'],
        type: json['type'],
        modified: json['modified'],
        thumbnail: thumbnail,
        creators: creators,
        characters: characters,
        stories: stories,
        comics: comics,
        events: events,
        next: next,
        previous: previous);
  }
}
