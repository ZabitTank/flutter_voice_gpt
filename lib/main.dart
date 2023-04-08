import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_voice_gpt/app/data/models/locals/global_setting_hive.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/global_setting_provider.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/gpt_chat_provider.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/gpt_model_provider.dart';
import 'package:flutter_voice_gpt/app/modules/settings_page/setting_screen.dart';
import 'package:flutter_voice_gpt/core/theme/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<GlobalSettingProvider> _setup() async {
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  Hive.registerAdapter(GlobalSettingAdapter());

  final globalSetting = GlobalSettingProvider();
  await globalSetting.initialize();
  return globalSetting;
}

void main() async {
  final globalSettingProvider = await _setup();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => globalSettingProvider,
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalSettingProvider>(
      // child: EasyLoading.init()??,
      builder: (context, value, child) => MaterialApp(
        title: 'Flutter Voice GPT',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: value.themeMode,
        builder: EasyLoading.init(),
        home: const SettingScreen(),
      ),
    );
  }
}
