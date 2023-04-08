import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_voice_gpt/app/data/models/locals/global_setting_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GlobalSettingProvider extends ChangeNotifier {
  late Box<GlobalSetting> database;
  late GlobalSetting appSettings;

  bool isUsingDarkMode = false;

  get themeMode {
    return appSettings.isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> initialize() async {
    database = await Hive.openBox<GlobalSetting>("settings");
    appSettings = database.get("setting") ?? GlobalSetting(chatHistory: []);
  }

  Future<void> toggleTheme(bool isDark) async {
    isUsingDarkMode = isDark;
    appSettings.isDark = isDark;

    EasyLoading.show();
    await database.put("setting", appSettings);
    notifyListeners();
    EasyLoading.dismiss();
  }
}
