import 'package:flutter_voice_gpt/app/data/models/rest/chat_completion_response.dart';

class ChatModel {
  final String msg;
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
