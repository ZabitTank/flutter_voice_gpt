import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/core/theme/base_style.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

ThemeData? activeTheme;

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepOrangeAccent,
    scaffoldBackgroundColor: Colors.white54,
    appBarTheme: const AppBarTheme(
      color: Colors.white38,
    ));

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.lightGreen,
    scaffoldBackgroundColor: const Color(0xff343541),
    cardColor: const Color(0xff444654),
    textTheme: TextTheme(
      bodySmall: BaseTextStyle.body3(color: Colors.white),
      bodyMedium: BaseTextStyle.body2(color: Colors.white),
      bodyLarge: BaseTextStyle.body1(color: Colors.white),
      headlineLarge: BaseTextStyle.heading1(color: Colors.white),
      headlineMedium: BaseTextStyle.heading2(color: Colors.white),
      headlineSmall: BaseTextStyle.heading3(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(color: Color.fromARGB(0, 53, 67, 55)));

extension GetTextStyle on BuildContext {
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
}
