import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/global_setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool autoReadText = false;

  String selectedLanguage = 'English'; // initialize with a default language
  String? apiKey; // initialize with an empty string

  List<String> languageOptions = [
    'Vietnamese',
    'English',
  ];

  @override
  Widget build(BuildContext context) {
    final globalSettingProvider = context.read<GlobalSettingProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings UI"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                value: Text(selectedLanguage),
                trailing: const Icon(Icons.keyboard_double_arrow_right),
                onPressed: (context) {
                  _showLanguageDialog();
                },
              ),
              SettingsTile.switchTile(
                onToggle: (value) async {
                  await globalSettingProvider.toggleTheme(value);

                  setState(() {});
                },
                initialValue: globalSettingProvider.appSettings.isDark,
                leading: const Icon(Icons.format_paint),
                title: const Text('Dark Mode'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Chat GPT Setting'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.key),
                title: const Text('API Key'),
                value: apiKey == null || apiKey == ""
                    ? Text("Currently using System Key")
                    : Text("Currently using Your Key"),
                trailing: const Icon(Icons.key),
                onPressed: (context) {
                  _showKeyDialog();
                },
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    autoReadText = !autoReadText;
                  });
                },
                initialValue: autoReadText,
                leading: const Icon(Icons.voice_chat),
                title: const Text('Auto read text'),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.key),
                title: const Text('API Key'),
                value: apiKey == null || apiKey == ""
                    ? Text("Currently using System Key")
                    : Text("Currently using Your Key"),
                trailing: const Icon(Icons.key),
                onPressed: (context) async {
                  bool? confirm = await showYesNoDialog(
                      context,
                      "Delete Chat History",
                      "Are you sure to delete chat history");

                  if (confirm != null && confirm == true) {
                  } else {}
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select a language'),
          children: languageOptions.map((String language) {
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
    ).then((selectedValue) {
      if (selectedValue != null) {
        setState(() {
          selectedLanguage = selectedValue; // update selected language
        });
      }
    });
  }

  void _showKeyDialog() {
    TextEditingController controller = TextEditingController(text: apiKey);
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter your API key'),
          content: TextField(
            controller: controller,
            obscureText: true,
            onChanged: (value) {
              apiKey = value; // update the API key as the user types
            },
            decoration: InputDecoration(hintText: 'API key'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(
                    context); // close the dialog without saving the key
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.pop(context,
                    apiKey); // close the dialog and return the entered key
              },
            ),
          ],
        );
      },
    ).then((selectedValue) {
      if (selectedValue != null) {
        setState(() {
          apiKey = selectedValue; // update the API key with the entered value
        });
      }
    });
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
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      );
    },
  );
}
