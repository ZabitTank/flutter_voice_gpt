import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../core/values/constants.dart';

class ModelDropdownWidget extends StatefulWidget {
  const ModelDropdownWidget({super.key});

  @override
  State<ModelDropdownWidget> createState() => _ModelDropdownWidgetState();
}

class _ModelDropdownWidgetState extends State<ModelDropdownWidget> {
  String currentModels = "Model1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      iconEnabledColor: Colors.green,
      items: TestObject.getModelsItem,
      value: currentModels,
      onChanged: (value) {
        print((value.toString()));
        setState(() {
          currentModels = value.toString();
        });
      },
    );
  }
}
