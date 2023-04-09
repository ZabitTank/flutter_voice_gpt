import 'package:flutter/material.dart';
import 'package:flutter_voice_gpt/app/data/models/locals/gpt_model_info.dart';
import 'package:flutter_voice_gpt/app/data/models/providers/gpt_model_provider.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/chat_ultils.dart';
import 'package:flutter_voice_gpt/app/modules/chat_page/widgets/message_widget.dart';
import 'package:flutter_voice_gpt/core/theme/base_style.dart';
import 'package:provider/provider.dart';

class ModelDropdownWidget extends StatefulWidget {
  const ModelDropdownWidget({super.key});

  @override
  State<ModelDropdownWidget> createState() => _ModelDropdownWidgetState();
}

class _ModelDropdownWidgetState extends State<ModelDropdownWidget> {
  String currentModels = "gpt-3.5-turbo";
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context, listen: false);
    currentModels = modelsProvider.getCurrentModel;
    return FutureBuilder<List<GPTModelInfo>>(
        future: modelsProvider.getAllModels(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: MessageContentWidget(
                label: snapshot.error.toString(),
                textStyle: BaseTextStyle.body1(color: Colors.red),
              ),
            );
          } else {
            return snapshot.data == null || snapshot.data!.isEmpty
                ? const SizedBox.shrink()
                : FittedBox(
                    child: DropdownButton(
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                      iconEnabledColor: const Color.fromARGB(255, 5, 5, 5),
                      items: ChatScreenUltils.getModelsAsDropdownMenuItem(
                          context, snapshot.data),
                      value: currentModels,
                      onChanged: (value) {
                        setState(() {
                          modelsProvider.setCurrentModel(value.toString());
                        });
                      },
                    ),
                  );
          }
        });
  }
}
