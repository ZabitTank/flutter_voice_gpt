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
  static const String openAiHost = "https://api.openai.com";
  static const String chatApi = "/v1/completions";
}

class CommonObject {
  static final chatMessages = [
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
      "msg": "Hello how are you",
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
      "msg": "Hello how are you",
      "chatIndex": 1,
    },
  ];
}
