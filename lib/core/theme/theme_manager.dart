import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/core/theme/colors.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: BaseColor.black,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.light,
);
