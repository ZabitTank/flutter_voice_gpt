import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_voice_gpt/app/data/models/locals/chat_history_hive.dart';
import 'package:flutter_voice_gpt/app/data/models/locals/chat_model_info.dart';
import 'package:flutter_voice_gpt/app/data/models/rest/chat_completion_request.dart';
import 'package:flutter_voice_gpt/app/data/models/rest/chat_completion_response.dart';
import 'package:flutter_voice_gpt/app/data/services/gpt_api_service.dart';
import 'package:flutter_voice_gpt/core/values/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChatProvider with ChangeNotifier {
  List<ChatCompletionMessage> _chatcompletionLog = [];

  late ChatHistory history;
  late Box<ChatHistory> database;

  List<ChatModel> get getChatList {
    return history.chatHistory;
  }

  Future<void> addUserMessage(
      {required String msg, String locale = "english"}) async {
    _chatcompletionLog.add(ChatCompletionMessage(
        role: "user", content: _shamelessTrickAddonInMessage(msg, locale)));
    history.chatHistory.add(ChatModel(msg: msg, chatIndex: 0));
    await database.put("chat", history);

    notifyListeners();
  }

  Future<String> sendMessageAndGetAnswers({
    required String msg,
    required String chosenModelId,
  }) async {
    try {
      var chatCompletion = await GptApiService.sendRequest(ChatComletionRequest(
          messages: _chatcompletionLog, model: chosenModelId));

      history.chatHistory.add(ChatModel(
          msg: chatCompletion.choices[0].message.content, chatIndex: 1));
      _chatcompletionLog.add(chatCompletion.choices[0].message);

      await database.put("chat", history);
      notifyListeners();

      return chatCompletion.choices[0].message.content;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> clearChatlog() async {
    await EasyLoading.show();
    history.chatHistory = [];
    await database.put("chat", history);
    notifyListeners();
    await EasyLoading.dismiss();
  }

  Future<void> initialize() async {
    database = await Hive.openBox<ChatHistory>("history");
    history = database.get("chat") ?? ChatHistory(chatHistory: []);
    _chatcompletionLog = ChatModel.modelsFromSnapshot(history.chatHistory);
  }

  String _shamelessTrickAddonInMessage(String message, String locale) {
    String addonString =
        AssetsManager.mapMyLocalizeToMessageAddon[locale] ?? "";
    return "$message$addonString}";
  }
}
