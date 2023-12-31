import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void setTheme(ThemeData theme) {
    theme == ThemeData.dark() ? _isDarkTheme = true : _isDarkTheme = false;
    notifyListeners();
  }
}
