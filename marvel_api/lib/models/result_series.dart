import 'package:marvel_api/models/list_type1.dart';
import 'package:marvel_api/models/list_type2.dart';
import 'package:marvel_api/models/thumbnail.dart';
import 'package:marvel_api/models/urls.dart';

class ResultSeries {
  final int? id;
  final String? title;
  final Null? description;
  final String? resourceURI;
  final List<Urls>? urls;
  final int? startYear;
  final int? endYear;
  final String? rating;
  final String? type;
  final String? modified;
  final Thumbnail? thumbnail;
  final ListType2? creators;
  final ListType1? characters;
  final ListType2? stories;
  final ListType1? comics;
  final ListType2? events;
  final Null? next;
  final Null? previous;

  ResultSeries(
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

  factory ResultSeries.fromMap(Map<String, dynamic> json) {
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
    var startYear = json['startYear'];
    var endYear = json['endYear'];
    var rating = json['rating'];
    var type = json['type'];
    var modified = json['modified'];
    var next = json['next'];
    var previous = json['previous'];
    var thumbnail =
        json['thumbnail'] == null ? null : Thumbnail.fromMap(json['thumbnail']);
    var creators =
        json['creators'] == null ? null : ListType2.fromMap(json['creators']);
    var characters = json['characters'] == null
        ? null
        : ListType1.fromMap(json['characters']);
    var stories =
        json['stories'] == null ? null : ListType2.fromMap(json['stories']);
    var comics =
        json['comics'] == null ? null : ListType1.fromMap(json['comics']);
    var events =
        json['events'] == null ? null : ListType2.fromMap(json['events']);

    return ResultSeries(
        id: id,
        title: title,
        description: description,
        resourceURI: resourceURI,
        urls: urls,
        startYear: startYear,
        endYear: endYear,
        rating: rating,
        type: type,
        modified: modified,
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
