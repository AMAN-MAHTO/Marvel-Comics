import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChangerProvider with ChangeNotifier {
  var _theme;
  ThemeMode get theme => _theme;

  late SharedPreferences pref;
  var _isDark = false;

  ThemeChangerProvider(bool isDark) {
    if (isDark) {
      _theme = ThemeMode.dark;
    } else {
      _theme = ThemeMode.light;
    }
  }

  Future<void> setTheme(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _theme = value;
    if (_theme == ThemeMode.dark) {
      print("dark");
      pref.setBool("is_dark", true);
    } else {
      pref.setBool("is_dark", false);
    }
    notifyListeners();
  }

  void toggleTheme() {}
}
