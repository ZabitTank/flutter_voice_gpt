import 'package:flutter_voice_gpt/app/data/models/locals/chat_model_info.dart';
import 'package:hive/hive.dart';

part 'chat_history_hive.g.dart';

@HiveType(typeId: 1)
class ChatHistory {
  @HiveField(0, defaultValue: [])
  List<ChatModel> chatHistory;

  ChatHistory({
    this.chatHistory = const [],
  });
}
