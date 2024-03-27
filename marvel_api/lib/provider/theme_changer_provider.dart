import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {
  var _theme = ThemeMode.system;
  ThemeMode get theme => _theme;

  void setTheme(value) {
    _theme = value;
    notifyListeners();
  }
}
