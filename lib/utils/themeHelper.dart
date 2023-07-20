// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ThemeHelper with ChangeNotifier {
  late ThemeMode themeMode;

  ThemeHelper(String theme) {
    if (theme == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
  }

  void changeTheme() async {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
