import 'package:flutter/material.dart';
import 'package:marvel_api/screens/character/character_list_screen.dart';
import 'package:marvel_api/screens/character/character_screen.dart';
import 'package:marvel_api/screens/comic/comic_screen.dart';
import 'package:marvel_api/screens/comic/comics_list_screen.dart';
import 'package:marvel_api/screens/event/event_list_screen.dart';
import 'package:marvel_api/screens/event/event_screen.dart';
import 'package:marvel_api/screens/home_screen.dart';
import 'package:marvel_api/screens/series/series_list_screen.dart';
import 'package:marvel_api/screens/series/series_screen.dart';
import 'package:marvel_api/screens/stories/stories_list_screen.dart';
import 'package:marvel_api/screens/stories/stories_screen.dart';
import 'package:marvel_api/screens/theme_changer_screen.dart';

class RoutGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/characters_list':
        return MaterialPageRoute(builder: (_) => CharacterListScreen());

      case '/character':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => CharacterScreen(id: args));
        } else
          return _errorRoute();
      case '/comics_list':
        return MaterialPageRoute(builder: (_) => ComicsListScreen());

      case '/comic':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => ComicScreen(id: args));
        } else
          return _errorRoute();

      case '/events_list':
        return MaterialPageRoute(builder: (_) => EventListScreen());

      case '/event':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => EventScreen(id: args));
        } else
          return _errorRoute();

      case '/series_list':
        return MaterialPageRoute(builder: (_) => SeriesListScreen());
      case '/series':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => SeriesScreen(id: args));
        } else
          return _errorRoute();

      case '/stories_list':
        return MaterialPageRoute(builder: (_) => StoriesListScreen());

      case '/storie':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => StorieScreen(id: args));
        } else
          return _errorRoute();

      case '/settings':
        return MaterialPageRoute(builder: (_) => ThemeChangerScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ERROR"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}
