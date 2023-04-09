import 'package:flutter_voice_gpt/core/values/enum.dart';

class MyLocalization {
  static String defaultLanguage = "english";

  static final Map<String, Map<String, String>> _localizedValues = {
    'english': {
      "language": "English",
      "chatscreen_hint_textfield": "How I can help you",
      "chatscreen_error_empty_textfield": "Please Enter message",
      "chatscreen_modal_select_modal": "Choose Model",
      "chatscreen_modal_error_modal": "Not Found anymodel",
      "settingscreen_appbar": "Setting UI",
      "settingscreen_section_common": "Common",
      "settingscreen_section_common_language": "Language",
      "settingscreen_section_common_theme": "Dark Mode",
      "settingscreen_section_gpt_key": "API Key",
      "settingscreen_section_gpt_use_system_key": "Currently using System Key",
      "settingscreen_section_gpt_use_your_key": "Currently using Your Key",
      "settingscreen_section_gpt": "Chat GPT Setting",
      "settingscreen_section_auto_voice": "Auto read text",
      "settingscreen_section_gpt_delete": "Delete Chat History",
      "settingscreen_section_chatlog": "Chat's History",
      "settingscreen_section_gpt_delete_confirm":
          "Are you sure to delete chat history",
      "select_localization": "Select a language",
      "enter_apikey": "Enter your API Key",
      "yes": "Yes",
      "no": "No"
    },
    'vietnam': {
      "language": "Tiếng Việt",
      "chatscreen_hint_textfield": "Làm thế nào tôi có thể giúp bạn",
      "chatscreen_error_empty_textfield": "Vui lòng nhập tin nhắn",
      "chatscreen_modal_select_modal": "Chọn mô hình",
      "chatscreen_modal_error_modal": "Không tìm thấy mô hình nào",
      "settingscreen_appbar": "Cài đặt giao diện",
      "settingscreen_section_common": "Chung",
      "settingscreen_section_common_language": "Ngôn ngữ",
      "settingscreen_section_common_theme": "Chế độ tối",
      "settingscreen_section_gpt_key": "Khóa API",
      "settingscreen_section_gpt_use_system_key": "Đang sử dụng khóa hệ thống",
      "settingscreen_section_gpt_use_your_key": "Đang sử dụng khóa của bạn",
      "settingscreen_section_gpt": "Cài đặt Chat GPT",
      "settingscreen_section_auto_voice": "Tự động đọc văn bản",
      "settingscreen_section_chatlog": "Lịch Sử chat",
      "settingscreen_section_gpt_delete": "Xóa Lịch sử Chat",
      "settingscreen_section_gpt_delete_confirm":
          "Bạn có chắc chắn muốn xóa lịch sử chat không",
      "select_localization": "Chọn ngôn ngữ",
      "enter_apikey": "Nhập key của bạn",
      "yes": "Có",
      "no": "Không"
    }
  };
  static set language(String? lang) {
    defaultLanguage = lang?.toString() ?? "english";
  }

  static String translate(LocalizationKeys key) {
    return _localizedValues[defaultLanguage]?[key.name] ?? "undefined";
  }
}
