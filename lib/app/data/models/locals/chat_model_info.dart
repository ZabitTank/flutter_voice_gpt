import 'package:flutter_voice_gpt/app/data/models/rest/chat_completion_response.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'chat_model_info.g.dart';

@HiveType(typeId: 3)
class ChatModel {
  @HiveField(0)
  final String msg;
  @HiveField(1)
  final int chatIndex;

  static List<ChatCompletionMessage> modelsFromSnapshot(
      List<ChatModel> modelSnapshot) {
    return modelSnapshot
        .map((data) => ChatCompletionMessage(
            role: data.chatIndex == 0 ? "user" : "assistant",
            content: data.msg))
        .toList();
  }

  ChatModel({required this.msg, required this.chatIndex});
}
