import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/widgets/message_widget.dart';

class AssetsManager {
  const AssetsManager();
  static const String imagePath = "assets/images";
  static const String iconPath = "assets/icons";

  static const String userImage = "$imagePath/person.png";
  static const String chatImage = "$imagePath/chat_logo.png";
  static const String openAILogo = "$imagePath/openai_logo.jpg";
}

class APIPath {
  const APIPath();
  static const String openAiHost = "https://api.openai.com/v1";

  static const String getModel = "/models";
  static const String getMessage = "/completetions";
}

TestObject testObject = TestObject();

class TestObject {
  static List<String> models = [
    "Model1",
    "Model2",
    "Model3",
    "Model4",
    "Model5",
    "Model6",
    "Model7",
    "Model8",
  ];

  static List<DropdownMenuItem<String>>? get getModelsItem {
    List<DropdownMenuItem<String>>? modelsItems =
        List<DropdownMenuItem<String>>.generate(
      models.length,
      (index) => DropdownMenuItem(
        value: models[index],
        child: MessageContentWidget(
          label: models[index],
          fontSize: 15,
        ),
      ),
    );
    return modelsItems;
  }

  static var chatMessages = [
    {
      "msg": "Hello how are you",
      "chatIndex": 0,
    },
    {
      "msg":
          "Hello, i am chatGPT, a large language model devloped by OpenAI. I am here to assit you",
      "chatIndex": 1,
    },
    {
      "msg": "Hello how are you",
      "chatIndex": 0,
    },
    {
      "msg":
          "Hello, i am chatGPT, a large language model devloped by OpenAI. I am here to assit you, Hello, i am chatGPT, a large language model devloped by OpenAI. I am here to assit you",
      "chatIndex": 1,
    },
    {
      "msg": "Hello how are you",
      "chatIndex": 0,
    },
    {
      "msg": "Hello how are you",
      "chatIndex": 1,
    },
    {
      "msg": "Hello how are you",
      "chatIndex": 0,
    },
    {
      "msg":
          "Hello how are you, Hello, i am chatGPT, a large language model devloped by OpenAI. I am here to assit you, Hello, i am chatGPT, a large language model devloped by OpenAI. I am here to assit you, Hello, i am chatGPT, a large language model devloped by OpenAI. I am here to assit you",
      "chatIndex": 1,
    },
  ];
}
