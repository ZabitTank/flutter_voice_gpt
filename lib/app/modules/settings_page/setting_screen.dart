import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/global_setting_provider.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/gpt_chat_provider.dart';
import 'package:flutter_voice_gpt/core/localization/my_localization.dart';
import 'package:flutter_voice_gpt/core/values/enum.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? apiKey;
  Map<String, List<String>> languageOptions = {
    "english": ['Vietnamese', 'English'],
    "vietnam": ['Tiếng Việt', 'Tiếng Anh'],
  };

  @override
  Widget build(BuildContext context) {
    final globalSettingProvider = context.read<GlobalSettingProvider>();
    final chatProvider = context.read<ChatProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
            MyLocalization.translate(LocalizationKeys.settingscreen_appbar)),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(MyLocalization.translate(
                LocalizationKeys.settingscreen_section_common)),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: Text(MyLocalization.translate(
                    LocalizationKeys.settingscreen_section_common_language)),
                value:
                    Text(MyLocalization.translate(LocalizationKeys.language)),
                trailing: const Icon(Icons.keyboard_double_arrow_right),
                onPressed: (context) async {
                  String? language =
                      await _showLanguageDialog(globalSettingProvider);
                  if (language != null) {
                    await _handleChangeLocalized(
                        globalSettingProvider, language);
                    setState(() {});
                  }
                },
              ),
              SettingsTile.switchTile(
                onToggle: (value) async {
                  await globalSettingProvider.toggleTheme(value);
                  setState(() {});
                },
                initialValue: globalSettingProvider.appSettings.isDark,
                leading: const Icon(Icons.format_paint),
                title: Text(MyLocalization.translate(
                    LocalizationKeys.settingscreen_section_common_theme)),
              ),
            ],
          ),
          SettingsSection(
            title: Text(MyLocalization.translate(
                LocalizationKeys.settingscreen_section_gpt)),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.key),
                title: Text(MyLocalization.translate(
                    LocalizationKeys.settingscreen_section_gpt_key)),
                trailing: const Icon(Icons.edit),
                onPressed: (context) async {
                  String? initKey = await GlobalSettingProvider.getAPIKey();
                  String? newApiKey = await _showKeyDialog(initKey);
                  await globalSettingProvider.handleUseAPIKey(newApiKey);
                  setState(() {});
                },
              ),
              SettingsTile.switchTile(
                onToggle: (value) async {
                  await globalSettingProvider.toggleAutoRead(value);
                  setState(() {});
                },
                initialValue: globalSettingProvider.appSettings.isAutoRead,
                leading: const Icon(Icons.voice_chat),
                title: Text(MyLocalization.translate(
                    LocalizationKeys.settingscreen_section_auto_voice)),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.history),
                title: Text(MyLocalization.translate(
                    LocalizationKeys.settingscreen_section_chatlog)),
                value: Text(MyLocalization.translate(
                    LocalizationKeys.settingscreen_section_gpt_delete)),
                trailing: const Icon(Icons.delete),
                onPressed: (context) async {
                  bool? confirm = await showYesNoDialog(
                      context,
                      MyLocalization.translate(
                          LocalizationKeys.settingscreen_section_gpt_delete),
                      MyLocalization.translate(LocalizationKeys
                          .settingscreen_section_gpt_delete_confirm));

                  if (confirm != null && confirm == true) {
                    await chatProvider.clearChatlog();
                  } else {}
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _handleChangeLocalized(
      GlobalSettingProvider globalSettingProvider, String language) async {
    switch (globalSettingProvider.appSettings.localization) {
      case "english":
        if (language == "Vietnamese") {
          await globalSettingProvider.toggleLocalization("vietnam");
        }
        break;
      case "vietnam":
        if (language == "Tiếng Anh") {
          await globalSettingProvider.toggleLocalization("english");
        }
        break;
    }
  }

  Future<String?> _showLanguageDialog(
      GlobalSettingProvider globalSettingProvider) {
    return showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        List<String>? language =
            languageOptions[globalSettingProvider.appSettings.localization];
        return SimpleDialog(
          title: Text(
              MyLocalization.translate(LocalizationKeys.select_localization)),
          children: language?.map((String language) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context,
                    language); // close the dialog and return the selected language
              },
              child: Text(language),
            );
          }).toList(),
        );
      },
    );
  }

  Future<String?> _showKeyDialog(String? apikey) {
    TextEditingController controller = TextEditingController(text: apikey);
    return showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              MyLocalization.translate(LocalizationKeys.enter_apikey_info)),
          content: TextField(
              controller: controller,
              obscureText: true,
              onChanged: (value) {
                apiKey = value; // update the API key as the user types
              },
              decoration:
                  const InputDecoration(hintText: 'Enter your API key')),
          actions: <Widget>[
            TextButton(
              child: Text(MyLocalization.translate(LocalizationKeys.no)),
              onPressed: () {
                Navigator.pop(
                    context); // close the dialog without saving the key
              },
            ),
            TextButton(
              child: Text(MyLocalization.translate(LocalizationKeys.yes)),
              onPressed: () {
                Navigator.pop(context,
                    apiKey); // close the dialog and return the entered key
              },
            ),
          ],
        );
      },
    );
  }
}

Future<bool?> showYesNoDialog(
    BuildContext context, String title, String message) async {
  return showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(MyLocalization.translate(LocalizationKeys.no)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(MyLocalization.translate(LocalizationKeys.yes)),
          ),
        ],
      );
    },
  );
}
