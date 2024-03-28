import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/models/result_comic.dart';

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

  static void getCreators() {}
  static void getEvents() {}
  static void getSeries() {}
}
