import 'package:marvel_api/models/thumbnail.dart';
import 'package:marvel_api/models/urls.dart';

import 'list_type2.dart';
import 'dates.dart';
import 'prices.dart';
import 'series.dart';
import 'text_objects.dart';

class ResultComic {
  final int? id;
  final int? digitalId;
  final String? title;
  final int? issueNumber;
  final String? variantDescription;
  final String? description;
  final String? modified;
  final String? isbn;
  final String? upc;
  final String? diamondCode;
  final String? ean;
  final String? issn;
  final String? format;
  final int? pageCount;
  final List<TextObjects>? textObjects;
  final String? resourceURI;
  final List<Urls>? urls;
  final Series? series;
  final List<Series>? variants;
  final List<Dates>? dates;
  final List<Prices>? prices;
  final Thumbnail? thumbnail;
  final List<Thumbnail>? images;
  final ListType2? creators;
  final ListType2? characters;
  final ListType2? stories;
  final ListType2? events;

  ResultComic(
      {required this.id,
      required this.digitalId,
      required this.title,
      required this.issueNumber,
      required this.variantDescription,
      required this.description,
      required this.modified,
      required this.isbn,
      required this.upc,
      required this.diamondCode,
      required this.ean,
      required this.issn,
      required this.format,
      required this.pageCount,
      required this.textObjects,
      required this.resourceURI,
      required this.urls,
      required this.series,
      required this.variants,
      required this.dates,
      required this.prices,
      required this.thumbnail,
      required this.images,
      required this.creators,
      required this.characters,
      required this.stories,
      required this.events});

  factory ResultComic.fromMap(Map<String, dynamic> json) {
    var textObjects = <TextObjects>[];
    if (json['textObjects'] != null) {
      json['textObjects'].forEach((v) {
        textObjects!.add(new TextObjects.fromMap(v));
      });
    }

    var urls = <Urls>[];
    if (json['urls'] != null) {
      json['urls'].forEach((v) {
        urls!.add(new Urls.fromMap(v));
      });
    }

    var variants = <Series>[];
    if (json['variants'] != null) {
      json['variants'].forEach((v) {
        variants!.add(new Series.fromMap(v));
      });
    }

    var dates = <Dates>[];
    if (json['dates'] != null) {
      json['dates'].forEach((v) {
        dates!.add(new Dates.fromMap(v));
      });
    }
    var prices = <Prices>[];
    if (json['prices'] != null) {
      json['prices'].forEach((v) {
        prices!.add(new Prices.fromMap(v));
      });
    }

    var images = <Thumbnail>[];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images!.add(Thumbnail.fromMap(v));
      });
    }
    var thumbnail =
        json['thumbnail'] == null ? null : Thumbnail.fromMap(json['thumbnail']);
    var series = json['series'] == null ? null : Series.fromMap(json['series']);
    var creators =
        json['creators'] == null ? null : ListType2.fromMap(json['creators']);
    var characters = json['characters'] == null
        ? null
        : ListType2.fromMap(json['characters']);
    var stories =
        json['stories'] == null ? null : ListType2.fromMap(json['stories']);
    var events =
        json['events'] == null ? null : ListType2.fromMap(json['events']);

    return ResultComic(
        id: json['id'],
        digitalId: json['digitalId'],
        title: json['title'],
        issueNumber: json['issueNumber'],
        variantDescription: json['variantDescription'],
        description: json['description?'],
        modified: json['modified'],
        isbn: json['isbn'],
        upc: json['upc'],
        diamondCode: json['diamondCode'],
        ean: json['ean'],
        issn: json['issn'],
        format: json['format'],
        pageCount: json['pageCount'],
        textObjects: textObjects,
        resourceURI: json['resourceURI'],
        urls: urls,
        series: series,
        variants: variants,
        dates: dates,
        prices: prices,
        thumbnail: thumbnail,
        images: images,
        creators: creators,
        characters: characters,
        stories: stories,
        events: events);
  }
}
