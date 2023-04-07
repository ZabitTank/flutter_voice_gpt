import 'package:flutter/material.dart';

class MessageContentWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const MessageContentWidget({
    Key? key,
    required this.label,
    this.fontSize = 14,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
