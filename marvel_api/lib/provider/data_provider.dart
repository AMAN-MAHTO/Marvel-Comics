import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/models/result_comic.dart';
import 'package:marvel_api/models/result_creator.dart';
import 'package:marvel_api/models/result_event.dart';
import 'package:marvel_api/models/result_series.dart';
import 'package:marvel_api/models/result_storie.dart';
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

  List<ResultSeries> _seriesList = [];
  var _seriesCallRunning = false;
  List<ResultSeries> get seriesList => _seriesList;

  void updateSeriesList({bool requestUpdate = false}) async {
    if ((_seriesList.isEmpty || requestUpdate) && _seriesCallRunning == false) {
      _seriesCallRunning = true;
      print('getting character');
      _seriesList = await MarvelAPI.getSeries();
      _seriesCallRunning = false;
      notifyListeners();
    }
  }

  List<ResultStorie> _storiesList = [];
  var _storiesCallRunning = false;
  List<ResultStorie> get storiesList => _storiesList;

  void updateStoriesList({bool requestUpdate = false}) async {
    if ((_storiesList.isEmpty || requestUpdate) &&
        _storiesCallRunning == false) {
      _storiesCallRunning = true;
      print('getting character');
      _storiesList = await MarvelAPI.getStories();
      _storiesCallRunning = false;
      notifyListeners();
    }
  }

  List<ResultCreator> _creatorList = [];
  var _creatorCallRunning = false;
  List<ResultCreator> get creatorList => _creatorList;

  void updateCreatorList({bool requestUpdate = false}) async {
    if ((_creatorList.isEmpty || requestUpdate) &&
        _creatorCallRunning == false) {
      _creatorCallRunning = true;
      print('getting character');
      _creatorList = await MarvelAPI.getCreators();
      _creatorCallRunning = false;
      notifyListeners();
    }
  }

  void updateCharacterList({bool requestUpdate = false}) async {
    if ((_charactersList.isEmpty || requestUpdate) &&
        _characterCallRunning == false) {
      _characterCallRunning = true;
      print('getting character');
      _charactersList = await MarvelAPI.getCharacters();
      _characterCallRunning = false;
      notifyListeners();
    }
  }

  void updateComicsList({bool requestUpdate = false}) async {
    if ((_comicsList.isEmpty || requestUpdate) && _comicCallRunning == false) {
      _comicCallRunning = true;
      print('getting comics');
      _comicsList = await MarvelAPI.getComics();
      _comicCallRunning = false;
      notifyListeners();
    }
  }

  void updateEventsList({bool requestUpdate = false}) async {
    if ((_eventsList.isEmpty || requestUpdate) && _eventCallRunning == false) {
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
    updateCreatorList();
    updateSeriesList();
    updateStoriesList();
  }

  getComicById(String id) {}
}
