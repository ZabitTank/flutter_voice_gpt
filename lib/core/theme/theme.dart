import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/core/theme/base_style.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(255, 125, 223, 12),
  scaffoldBackgroundColor: const Color.fromARGB(255, 82, 196, 139),
  cardColor: Color.fromARGB(255, 151, 243, 120),
  textTheme: TextTheme(
    bodySmall: BaseTextStyle.body3(color: Colors.black),
    bodyMedium: BaseTextStyle.body2(color: Colors.black),
    bodyLarge: BaseTextStyle.body1(color: Colors.black),
    headlineLarge: BaseTextStyle.heading1(color: Colors.black),
    headlineMedium: BaseTextStyle.heading2(color: Colors.black),
    headlineSmall: BaseTextStyle.heading3(color: Colors.black),
    labelSmall: BaseTextStyle.caption(
      color: const Color.fromARGB(255, 210, 66, 66),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(0, 53, 67, 55),
  ),
);

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
    labelSmall: BaseTextStyle.caption(
      color: Color.fromARGB(255, 60, 234, 135),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(0, 53, 67, 55),
  ),
);

extension GetTextStyle on BuildContext {
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
}
