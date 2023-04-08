import 'package:flutter_voice_gpt/app/data/models/locals/chat_model_info.dart';
import 'package:hive/hive.dart';

part 'global_setting_hive.g.dart';

@HiveType(typeId: 0)
class GlobalSetting {
  @HiveField(0, defaultValue: false)
  bool isDark;

  @HiveField(1, defaultValue: false)
  bool isAutoRead;

  @HiveField(2, defaultValue: [])
  List<ChatModel> chatHistory;

  GlobalSetting({
    this.isDark = false,
    this.isAutoRead = false,
    this.chatHistory = const [],
  });
}
