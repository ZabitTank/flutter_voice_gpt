import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/gpt_chat_provider.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/gpt_model_provider.dart';
import 'package:flutter_voice_gpt/app/data/services/gpt_api_service.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/chat_service.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/widgets/chat_widget.dart';
import 'package:flutter_voice_gpt/app/widgets/utils_widget.dart';
import 'package:flutter_voice_gpt/core/theme/theme.dart';
import 'package:flutter_voice_gpt/core/values/constants.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late bool _isTyping;
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  late ScrollController scrollController;

  @override
  void initState() {
    _isTyping = false;
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    scrollController = ScrollController();
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
                await ChatService.showModalSheet(context);
              },
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              controller: scrollController,
              itemCount: chatProvider.chatList.length,
              itemBuilder: (context, index) => ChatWidget(
                chatIndex: chatProvider.chatList[index].chatIndex,
                msg: chatProvider.chatList[index].msg,
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
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                        hintText: "How I can help you ",
                        hintStyle: context.labelSmall,
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await handleSendMessage(
                        chatProvider: chatProvider,
                        modelsProvider: modelsProvider);
                  },
                  icon: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Future<void> handleSendMessage(
      {required ModelsProvider modelsProvider,
      required ChatProvider chatProvider}) async {
    try {
      if (textEditingController.text.isEmpty) {
        ChatService.showError(context, "Please Enter message");
        return;
      }
      setState(() {
        _resetTextFieldStateBefore(chatProvider);
      });
      await chatProvider.sendMessageAndGetAnswers(
          msg: textEditingController.text,
          chosenModelId: modelsProvider.currentModel);
    } catch (e) {
      ChatService.showError(context, e.toString());
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

  void _resetTextFieldStateAfter() {
    scrollToTheEnd();
    _isTyping = false;
  }

  void _resetTextFieldStateBefore(ChatProvider chatProvider) {
    _isTyping = true;
    chatProvider.addUserMessage(msg: textEditingController.text);
    textEditingController.clear();
    focusNode.unfocus();
    scrollToTheEnd();
  }
}
