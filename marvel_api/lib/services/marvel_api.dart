import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:marvel_api/models/character.dart';

const BASE_URL = 'http://gateway.marvel.com/v1/public';
const AUTH =
    '?ts=1&apikey=fba4bd18255527cf8a595a9990537951&hash=9ec3249fa922bec70714e01765d67aca';

class MarvelAPI {
  static Future<List<Character>> fetchCharacters() async {
    const url = '${BASE_URL}/characters${AUTH}';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    final body = respond.body;
    final json = jsonDecode(body);
    List<Character> results = [];
    if (json['data']['results'] != null) {
      json['data']['results'].forEach((v) {
        results.add(Character.fromMap(v));
        // print(results);
      });
    }
    return results;
  }
}
