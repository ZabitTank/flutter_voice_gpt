import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_voice_gpt/core/values/constants.dart';

class TTSService {
  static final FlutterTts _flutterTts = FlutterTts();

  final double _vol = 1.0;
  final double _pitch = 1.0;
  double speechRate = 0.6;

  static Future<void> speak(String text) async {
    await _flutterTts.speak(text);
  }

  static Future<void> stop() async {
    await _flutterTts.stop();
  }

  static Future<void> changeLocalization(String myLocale) async {
    await _flutterTts.setLanguage(
        AssetsManager.mapMyLocalizeToLanguageCode[myLocale] ?? "en-US");
  }
}
