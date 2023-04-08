import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/widgets/dropdown.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/widgets/message_widget.dart';

class ChatController {
  static Future<void> showModalSheet(BuildContext context) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child:
                      MessageContentWidget(label: "Choose Model", fontSize: 16),
                ),
                Flexible(
                  flex: 2,
                  child: ModelDropdownWidget(),
                ),
              ],
            ),
          );
        });
  }
}
