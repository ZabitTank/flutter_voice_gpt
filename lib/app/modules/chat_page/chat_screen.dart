import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_voice_gpt/app/data/services/gpt_api_service.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/chat_screen.controller.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/widgets/chat_widget.dart';
import 'package:flutter_voice_gpt/app/widgets/utils_widget.dart';
import 'package:flutter_voice_gpt/core/theme/theme.dart';
import 'package:flutter_voice_gpt/core/values/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late bool _isTyping;
  late TextEditingController textEditingController;

  @override
  void initState() {
    _isTyping = true;
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _isTyping = true;
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
                await ChatController.showModalSheet(context);
              },
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) => ChatWidget(
                chatIndex: int.parse(
                    TestObject.chatMessages[index]['chatIndex'].toString()),
                msg: TestObject.chatMessages[index]['msg'].toString(),
              ),
            ),
          ),
          if (_isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
            addVerticalSpace(15),
            Material(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      onSubmitted: (value) {},
                      decoration: InputDecoration.collapsed(
                        hintText: "How I can help you ",
                        hintStyle: context.bodyMedium,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      try {
                        await GptApiService.getModels();
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    icon: const Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ],
      )),
    );
  }
}
