import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/models/result_comic.dart';
import 'package:marvel_api/models/result_event.dart';
import 'package:marvel_api/services/marvel_api_impl.dart';

class DataProvider with ChangeNotifier {
  List<ResultCharacter> _charactersList = [];
  var _characterCallRunning = false;
  List<ResultCharacter> get characterList => _charactersList;

  List<ResultComic> _comicsList = [];
  var _comicCallRunning = false;
  List<ResultComic> get comicsList => _comicsList;

  List<ResultEvent> _eventsList = [];
  var _eventCallRunning = false;
  List<ResultEvent> get eventsList => _eventsList;

  void updateCharacterList({bool requestUpdate = false}) async {
    if (_charactersList.isEmpty && _characterCallRunning == false) {
      _characterCallRunning = true;
      print('getting character');
      _charactersList = await MarvelAPI.getCharacters();
      _characterCallRunning = false;
      notifyListeners();
    }
  }

  void updateComicsList({bool requestUpdate = false}) async {
    if (_comicsList.isEmpty && _comicCallRunning == false) {
      _comicCallRunning = true;
      print('getting comics');
      _comicsList = await MarvelAPI.getComics();
      _comicCallRunning = false;
      notifyListeners();
    }
  }

  void updateEventsList({bool requestUpdate = false}) async {
    if (_eventsList.isEmpty && _eventCallRunning == false) {
      _eventCallRunning = true;
      print('getting events');
      _eventsList = await MarvelAPI.getEvents();
      _eventCallRunning = false;
      notifyListeners();
    }
  }

  void fetchData() {
    updateEventsList();
    updateCharacterList();
    updateComicsList();
  }
}
