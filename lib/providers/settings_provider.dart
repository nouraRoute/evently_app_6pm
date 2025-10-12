import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  String local = 'en';
  editThemeMode(ThemeMode themeData) {
    appTheme = themeData;
    notifyListeners();
  }

  editLocalization(String localization) {
    local = localization;
    notifyListeners();
  }
}
