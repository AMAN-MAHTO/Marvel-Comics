import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/models/result_comic.dart';
import 'package:marvel_api/models/result_creator.dart';
import 'package:marvel_api/models/result_event.dart';
import 'package:marvel_api/models/result_series.dart';

const BASE_URL = 'http://gateway.marvel.com/v1/public';
const AUTH =
    '?ts=1&apikey=fba4bd18255527cf8a595a9990537951&hash=9ec3249fa922bec70714e01765d67aca';

class MarvelAPI {
  static Future<List<ResultCharacter>> getCharacters() async {
    const url = '${BASE_URL}/characters${AUTH}';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    final body = respond.body;
    final json = jsonDecode(body);
    List<ResultCharacter> results = [];
    if (json['data']['results'] != null) {
      json['data']['results'].forEach((v) {
        results.add(ResultCharacter.fromMap(v));
        // print(results);
      });
    }
    return results;
  }

  static Future<ResultCharacter?> getCharacterById(String id) async {
    final url = '${BASE_URL}/characters/${id}${AUTH}';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    final body = respond.body;
    final json = jsonDecode(body);
    ResultCharacter? results = null;
    if (json['data']['results'] != null) {
      results = ResultCharacter.fromMap(json['data']['results'][0]);
      // print(results);
    }
    return results;
  }

  static Future<List<ResultComic>> getComics() async {
    const url = '${BASE_URL}/comics${AUTH}';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    final body = respond.body;
    final json = jsonDecode(body);
    List<ResultComic> results = [];
    if (json['data']['results'] != null) {
      json['data']['results'].forEach((v) {
        results.add(ResultComic.fromMap(v));
        // print(results);
      });
    }
    return results;
  }

  static Future<ResultComic?> getComicById(String id) async {
    final url = '${BASE_URL}/comics/${id}${AUTH}';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    final body = respond.body;
    final json = jsonDecode(body);
    ResultComic? results;
    if (json['data']['results'] != null) {
      results = ResultComic.fromMap(json['data']['results'][0]);
    }
    return results;
  }

  static Future<List<ResultCreator>> getCreators() async {
    const url = '${BASE_URL}/creators${AUTH}';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    final body = respond.body;
    final json = jsonDecode(body);
    List<ResultCreator> results = [];
    if (json['data']['results'] != null) {
      json['data']['results'].forEach((v) {
        results.add(ResultCreator.fromMap(v));
        // print(results);
      });
    }
    return results;
  }

  static Future<ResultCreator?> getCreatorsById(String id) async {
    const url = '${BASE_URL}/creators${AUTH}';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    final body = respond.body;
    final json = jsonDecode(body);
    ResultCreator? results;
    if (json['data']['results'] != null) {
      results = (ResultCreator.fromMap(json['data']['results'][0]));
      // print(results);
    }
    return results;
  }

  static Future<List<ResultEvent>> getEvents() async {
    const url = '${BASE_URL}/creators${AUTH}';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    final body = respond.body;
    final json = jsonDecode(body);
    List<ResultEvent> results = [];
    if (json['data']['results'] != null) {
      json['data']['results'].forEach((v) {
        results.add(ResultEvent.fromMap(v));
        // print(results);
      });
    }
    return results;
  }

  static Future<ResultEvent?> getEventById(String id) async {
    const url = '${BASE_URL}/creators${AUTH}';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    final body = respond.body;
    final json = jsonDecode(body);
    ResultEvent? results;
    if (json['data']['results'] != null) {
      results = (ResultEvent.fromMap(json['data']['results'][0]));
      // print(results);
    }
    return results;
  }

  static Future<List<ResultSeries>> getSeries() async {
    const url = '${BASE_URL}/creators${AUTH}';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    final body = respond.body;
    final json = jsonDecode(body);
    List<ResultSeries> results = [];
    if (json['data']['results'] != null) {
      json['data']['results'].forEach((v) {
        results.add(ResultSeries.fromMap(v));
        // print(results);
      });
    }
    return results;
  }

  static Future<ResultSeries?> getSeriesById(String id) async {
    const url = '${BASE_URL}/creators${AUTH}';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    final body = respond.body;
    final json = jsonDecode(body);
    ResultSeries? results;
    if (json['data']['results'] != null) {
      results = (ResultSeries.fromMap(json['data']['results'][0]));
      // print(results);
    }
    return results;
  }
}
