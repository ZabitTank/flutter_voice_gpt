import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/chat_screen.dart';
import 'package:flutter_voice_gpt/core/theme/theme.dart';

ThemeManager themeManager = ThemeManager();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Voice GPT',
      theme: darkTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home: const ChatScreen(),
    );
  }
}
