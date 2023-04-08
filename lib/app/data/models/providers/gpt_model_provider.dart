import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/app/data/models/locals/gpt_model_info.dart';
import 'package:flutter_voice_gpt/app/data/services/gpt_api_service.dart';

class ModelsProvider with ChangeNotifier {
  String currentModel = "gpt-3.5-turbo-0301";
  List<GPTModelInfo> modelsList = [];

  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  List<GPTModelInfo> get getModelsList {
    return modelsList;
  }

  Future<List<GPTModelInfo>> getAllModels() async {
    modelsList = await GptApiService.getModels();
    return modelsList;
  }
}
