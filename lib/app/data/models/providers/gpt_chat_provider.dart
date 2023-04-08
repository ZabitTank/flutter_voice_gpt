import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/app/data/models/locals/chat_model_info.dart';
import 'package:flutter_voice_gpt/app/data/models/rest/chat_completion_request.dart';
import 'package:flutter_voice_gpt/app/data/models/rest/chat_completion_response.dart';
import 'package:flutter_voice_gpt/app/data/services/gpt_api_service.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatCompletionMessage> _chatLog = [];

  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    _chatLog.add(ChatCompletionMessage(role: "user", content: msg));
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String chosenModelId}) async {
    try {
      var chatCompletion = await GptApiService.sendRequest(
          ChatComletionRequest(messages: _chatLog, model: chosenModelId));

      chatList.add(ChatModel(
          msg: chatCompletion.choices[0].message.content, chatIndex: 1));
      _chatLog.add(chatCompletion.choices[0].message);
      notifyListeners();
    } catch (e) {
      Future.error(e);
    }
  }
}
