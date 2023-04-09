import 'package:hive/hive.dart';

part 'global_setting_hive.g.dart';

@HiveType(typeId: 0)
class GlobalSetting {
  @HiveField(0, defaultValue: false)
  bool isDark;

  @HiveField(1, defaultValue: false)
  bool isAutoRead;

  @HiveField(2)
  String localization;

  GlobalSetting({
    this.isDark = false,
    this.isAutoRead = false,
    this.localization = "english",
  });
}
