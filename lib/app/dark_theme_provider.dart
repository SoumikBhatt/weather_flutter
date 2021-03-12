import 'package:flutter/material.dart';
import 'package:weather_zone/preference/preference_manager.dart';

class DarkThemeProvider with ChangeNotifier {
  PrefManager darkThemePreference = PrefManager();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}