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
