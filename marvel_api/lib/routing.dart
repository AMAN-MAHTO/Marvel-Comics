import 'package:flutter/material.dart';
import 'package:marvel_api/screens/character/character_list_screen.dart';
import 'package:marvel_api/screens/character/character_screen.dart';
import 'package:marvel_api/screens/comic/comic_screen.dart';
import 'package:marvel_api/screens/comic/comics_list_screen.dart';
import 'package:marvel_api/screens/event/event_list_screen.dart';
import 'package:marvel_api/screens/home_screen.dart';

class RoutGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/characters':
        return MaterialPageRoute(builder: (_) => CharacterListScreen());

      case '/character':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => CharacterScreen(id: args));
        } else
          return _errorRoute();
      case '/comics':
        return MaterialPageRoute(builder: (_) => ComicsListScreen());

      case '/comic':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => ComicScreen(id: args));
        } else
          return _errorRoute();
      
      case '/events':
        return MaterialPageRoute(builder: (_) => EventListScreen());

      case '/event':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => ComicScreen(id: args));
        } else
          return _errorRoute();

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
