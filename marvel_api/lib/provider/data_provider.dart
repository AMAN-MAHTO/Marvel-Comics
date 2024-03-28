import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/models/result_comic.dart';
import 'package:marvel_api/models/result_event.dart';
import 'package:marvel_api/services/marvel_api_impl.dart';

class DataProvider with ChangeNotifier {
  List<ResultCharacter> _charactersList = [];
  List<ResultCharacter> get characterList => _charactersList;

  void updateCharacterList() async {
    print('getting character');
    _charactersList = await MarvelAPI.getCharacters();
    notifyListeners();
  }

  List<ResultComic> _comicsList = [];
  List<ResultComic> get comicsList => _comicsList;

  void updateComicsList() async {
    print('getting comics');
    _comicsList = await MarvelAPI.getComics();
    notifyListeners();
  }

  List<ResultEvent> _eventsList = [];
  List<ResultEvent> get eventsList => _eventsList;

  void updateEventsList() async {
    print('getting comics');
    _eventsList = await MarvelAPI.getEvents();
    notifyListeners();
  }
}
