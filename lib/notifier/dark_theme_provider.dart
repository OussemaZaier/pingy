import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/dark_theme_preference.dart';

class DarkThemeProvider with ChangeNotifier {
  final darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
