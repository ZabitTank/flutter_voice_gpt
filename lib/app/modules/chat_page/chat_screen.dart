import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_voice_gpt/app/data/models/locals/global_setting_hive.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/global_setting_provider.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/gpt_chat_provider.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/gpt_model_provider.dart';
import 'package:flutter_voice_gpt/app/data/services/stt_service.dart';
import 'package:flutter_voice_gpt/app/data/services/tts_service.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/chat_ultils.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/widgets/chat_widget.dart';
import 'package:flutter_voice_gpt/app/modules/settings_page/setting_screen.dart';
import 'package:flutter_voice_gpt/app/widgets/utils_widget.dart';
import 'package:flutter_voice_gpt/core/localization/my_localization.dart';
import 'package:flutter_voice_gpt/core/theme/theme.dart';
import 'package:flutter_voice_gpt/core/values/constants.dart';
import 'package:flutter_voice_gpt/core/values/enum.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  SpeechToText speechToText = SpeechToText();
  late bool _isTyping;
  late bool _isListening;

  late TextEditingController textEditingController;
  late bool isWaitingResponse;

  late FocusNode focusNode;
  late ScrollController scrollController;

  @override
  void initState() {
    _isListening = false;
    _isTyping = false;
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    scrollController = ScrollController();
    isWaitingResponse = false;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    final globalSettingProvider = context.read<GlobalSettingProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(AssetsManager.openAILogo),
        ),
        title: const Text("Voice GPT"),
        actions: [
          IconButton(
            onPressed: () async {
              await ChatScreenUltils.showModalSheet(context);
            },
            icon: const Icon(
              Icons.assistant,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              EasyLoading.show().then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()),
                );
              }).whenComplete(() => EasyLoading.dismiss());
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              controller: scrollController,
              itemCount: chatProvider.getChatList.length,
              itemBuilder: (context, index) => ChatWidget(
                chatIndex: chatProvider.getChatList[index].chatIndex,
                msg: chatProvider.getChatList[index].msg,
              ),
            ),
          ),
          if (_isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
          ],
          addVerticalSpace(15),
          Material(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    controller: textEditingController,
                    enabled: !isWaitingResponse,
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                        hintText: MyLocalization.translate(
                            LocalizationKeys.chatscreen_hint_textfield),
                        hintStyle: context.labelSmall,
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await handleSendMessage(
                        chatProvider: chatProvider,
                        globalSettingProvider: globalSettingProvider,
                        modelsProvider: modelsProvider);
                  },
                  icon: const Icon(Icons.send,
                      color: Color.fromARGB(255, 63, 150, 4)),
                ),
                AvatarGlow(
                    endRadius: 30.0,
                    animate: _isListening,
                    showTwoGlows: true,
                    glowColor: const Color.fromARGB(255, 0, 255, 8),
                    duration: const Duration(milliseconds: 2000),
                    repeat: true,
                    repeatPauseDuration: const Duration(microseconds: 100),
                    child: GestureDetector(
                      onTapDown: (details) async {
                        if (isWaitingResponse) return;

                        var avaiable = await speechToText.initialize();
                        if (avaiable) {
                          setState(() {
                            _isListening = true;
                            speechToText.listen(
                              onResult: (result) {
                                setState(() {
                                  textEditingController.text =
                                      result.recognizedWords;
                                });
                              },
                            );
                          });
                        }
                      },
                      onTapUp: (details) async {
                        await speechToText.stop();

                        setState(() {
                          _isListening = false;
                        });
                      },
                      child: CircleAvatar(
                        radius: 20,
                        child: Icon(_isListening ? Icons.mic : Icons.mic_none),
                      ),
                    )),
              ],
            ),
          )
        ],
      )),
    );
  }

  Future<void> handleSendMessage(
      {required ModelsProvider modelsProvider,
      required GlobalSettingProvider globalSettingProvider,
      required ChatProvider chatProvider}) async {
    try {
      if (textEditingController.text.isEmpty) {
        ChatScreenUltils.showError(
            context,
            MyLocalization.translate(
                LocalizationKeys.chatscreen_error_empty_textfield));
        return;
      }
      await chatProvider.addUserMessage(
          msg: textEditingController.text,
          locale: globalSettingProvider.appSettings.localization);

      setState(() {
        _resetTextFieldStateBefore();
      });

      String generatedText = await chatProvider.sendMessageAndGetAnswers(
          msg: textEditingController.text,
          chosenModelId: modelsProvider.currentModel);

      if (globalSettingProvider.appSettings.isAutoRead) {
        TTSService.speak(generatedText);
      }
    } catch (e) {
      ChatScreenUltils.showError(context, e.toString());
    } finally {
      setState(() {
        _resetTextFieldStateAfter();
      });
    }
  }

  void scrollToTheEnd() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2), curve: Curves.easeOut);
  }

  void _resetTextFieldStateBefore() {
    _isTyping = true;
    isWaitingResponse = true;
    textEditingController.clear();
    focusNode.unfocus();
    scrollToTheEnd();
  }

  void _resetTextFieldStateAfter() {
    scrollToTheEnd();
    _isTyping = false;
    isWaitingResponse = false;
  }
}
