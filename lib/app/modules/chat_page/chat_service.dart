import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/app/data/models/locals/gpt_model_info.dart';

import 'package:flutter_voice_gpt/app/modules/chat_page/widgets/dropdown.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/widgets/message_widget.dart';
import 'package:flutter_voice_gpt/core/theme/theme.dart';

class ChatService {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Flexible(
                  child:
                      MessageContentWidget(label: "Choose Model", fontSize: 16),
                ),
                Flexible(
                  child: ModelDropdownWidget(),
                ),
              ],
            ),
          );
        });
  }

  static List<DropdownMenuItem<String>> getModelsAsDropdownMenuItem(
      List<GPTModelInfo>? models) {
    List<DropdownMenuItem<String>>? modelsItems =
        List<DropdownMenuItem<String>>.generate(
      models?.length ?? 0,
      (index) => DropdownMenuItem(
        value: models?[index].id,
        child: MessageContentWidget(
          label: models?[index].id ?? "Not Found anymodel",
          fontSize: 15,
        ),
      ),
    );

    return modelsItems;
  }

  static void showError(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error, style: context.bodyMedium),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
