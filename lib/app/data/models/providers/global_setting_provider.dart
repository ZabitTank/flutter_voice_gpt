import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_voice_gpt/app/data/models/locals/global_setting_hive.dart';
import 'package:flutter_voice_gpt/app/data/providers/api_provider.dart';
import 'package:flutter_voice_gpt/app/data/services/gpt_api_service.dart';
import 'package:flutter_voice_gpt/app/data/services/tts_service.dart';
import 'package:flutter_voice_gpt/core/localization/my_localization.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GlobalSettingProvider extends ChangeNotifier {
  late Box<GlobalSetting> database;
  late GlobalSetting appSettings;

  get themeMode {
    return appSettings.isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> initialize() async {
    database = await Hive.openBox<GlobalSetting>("settings");
    appSettings = database.get("setting") ?? GlobalSetting();
    MyLocalization.language = appSettings.localization;
  }

  Future<void> toggleTheme(bool isDark) async {
    await EasyLoading.show();

    appSettings.isDark = isDark;
    await database.put("setting", appSettings);
    notifyListeners();

    EasyLoading.dismiss();
  }

  Future<void> toggleLocalization(String localization) async {
    await EasyLoading.show();

    await TTSService.changeLocalization(appSettings.localization);
    appSettings.localization = localization;
    MyLocalization.language = appSettings.localization;
    await database.put("setting", appSettings);

    notifyListeners();

    await EasyLoading.dismiss();
  }

  Future<void> toggleAutoRead(bool isAutoread) async {
    appSettings.isAutoRead = isAutoread;

    await database.put("setting", appSettings);
    notifyListeners();
  }

  Future<void> handleUseAPIKey(String? apiKey) async {
    if (apiKey != null && apiKey.isNotEmpty) {
      await APIHandlerImp.instance.storeAPIKey(apiKey);
    } else {
      await APIHandlerImp.instance.deleteToken();
    }
  }

  static Future<String?> getAPIKey() async {
    return await APIHandlerImp.instance.getAPIKey();
  }
}
