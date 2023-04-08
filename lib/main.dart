import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/gpt_chat_provider.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/gpt_model_provider.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/chat_screen.dart';
import 'package:flutter_voice_gpt/core/theme/theme.dart';
import 'package:provider/provider.dart';

ThemeManager themeManager = ThemeManager();

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Voice GPT',
        theme: darkTheme,
        darkTheme: darkTheme,
        themeMode: themeManager.themeMode,
        home: const ChatScreen(),
      ),
    );
  }
}
