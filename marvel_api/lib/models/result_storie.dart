import 'dart:math';

import 'package:marvel_api/models/list_type1.dart';
import 'package:marvel_api/models/list_type2.dart';
import 'package:marvel_api/models/items2.dart';
import 'package:marvel_api/models/series.dart';
import 'package:marvel_api/models/thumbnail.dart';

class ResultStorie {
  final int? id;
  final String? title;
  final String? description;
  final String? resourceURI;
  final String? type;
  final String? modified;
  final Thumbnail? thumbnail;
  final ListType2? creators;
  final ListType2? characters;
  final Series? series;
  final Series? comics;
  final ListType2? events;
  final Items2? originalIssue;

  ResultStorie(
      {required this.id,
      required this.title,
      required this.description,
      required this.resourceURI,
      required this.type,
      required this.modified,
      required this.thumbnail,
      required this.creators,
      required this.characters,
      required this.series,
      required this.comics,
      required this.events,
      required this.originalIssue});

  factory ResultStorie.fromMap(Map<String, dynamic> json) {
    final thumbnail =
        json['thumbnail'] == null ? null : Thumbnail.fromMap(json['thumbnail']);
    final comics =
        json['comics'] == null ? null : Series.fromMap(json['comics']);
    final series =
        json['series'] == null ? null : Series.fromMap(json['series']);
    var creators =
        json['creators'] == null ? null : ListType2.fromMap(json['creators']);
    var characters = json['characters'] == null
        ? null
        : ListType2.fromMap(json['characters']);

    var events =
        json['events'] == null ? null : ListType2.fromMap(json['events']);
    var originalIssue = json['originalIssue'] == null
        ? null
        : Items2.fromMap(json['originalIssue']);

    return ResultStorie(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        resourceURI: json['resourceURI'],
        type: json['type'],
        modified: json['modified'],
        thumbnail: thumbnail,
        creators: creators,
        characters: characters,
        series: series,
        comics: comics,
        events: events,
        originalIssue: originalIssue);
  }
}
