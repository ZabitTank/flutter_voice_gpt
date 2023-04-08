import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppLocalizations {
  final String locale;
  // Static member to have a simple access to the delegate from the MaterialApp

  MyAppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static MyAppLocalizations? of(BuildContext context) {
    return Localizations.of<MyAppLocalizations>(context, MyAppLocalizations);
  }

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    _localizedStrings =
        await loadStringMapFromJsonFile('localizations/$locale.json');

    return true;
  }

  Future<Map<String, dynamic>> loadJsonFile(String filename) async {
    String data = await rootBundle.loadString(filename);
    return json.decode(data);
  }

  Future<Map<String, String>> loadStringMapFromJsonFile(String filename) async {
    Map<String, dynamic> jsonMap = await loadJsonFile(filename);
    return Map<String, String>.from(jsonMap);
  }

  // This method will be called from every widget which needs a localized text
  String? translate(String key) {
    return _localizedStrings[key];
  }
}
