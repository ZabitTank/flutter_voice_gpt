enum TokenType {
  accessToken,
  refreshToken,
  apiToken,
}

enum LocalizationKeys {
  language,
  chatscreen_hint_textfield,
  chatscreen_error_empty_textfield,
  chatscreen_modal_select_modal,
  chatscreen_modal_error_modal,
  settingscreen_appbar,
  settingscreen_section_common,
  settingscreen_section_common_language,
  settingscreen_section_common_theme,
  settingscreen_section_gpt_key,
  settingscreen_section_gpt_use_system_key,
  settingscreen_section_gpt_use_your_key,
  settingscreen_section_gpt,
  settingscreen_section_auto_voice,
  settingscreen_section_gpt_delete,
  settingscreen_section_gpt_delete_confirm,
  settingscreen_section_chatlog,
  select_localization,
  enter_apikey,
  yes,
  no,
}

enum MyAppLocalizations {
  vietnam("vietnam"),
  english("english");

  final String filename;

  const MyAppLocalizations(this.filename);
}
