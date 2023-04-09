class AssetsManager {
  const AssetsManager();
  static const String imagePath = "assets/images";
  static const String iconPath = "assets/icons";

  static const String userImage = "$imagePath/person.png";
  static const String chatImage = "$imagePath/chat_logo.png";
  static const String openAILogo = "$imagePath/openai_logo.jpg";

  static final Map<String, String> mapMyLocalizeToLanguageCode = {
    "english": "en-US",
    "vietnam": "vi-VN",
  };

  static final Map<String, String> mapMyLocalizeToMessageAddon = {
    "english": ", Please answer by english",
    "vietnam": ", Trả lời bằng tiếng việt",
  };
}

class APIPath {
  const APIPath();
  static const String openAiHost = "https://api.openai.com/v1";

  static const String getModel = "/models";
  static const String getMessage = "/chat/completions";
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
}
