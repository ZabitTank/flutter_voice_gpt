import 'package:flutter/material.dart';

class BaseTextStyle {
  static TextStyle heading1(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 32, color: color, fontWeight: FontWeight.w400);
  }

  static TextStyle heading2(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 24, color: color, fontWeight: FontWeight.w500);
  }

  static TextStyle heading3(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 24, color: color, fontWeight: FontWeight.w400);
  }

  static TextStyle heading4(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 20, color: color, fontWeight: FontWeight.w600);
  }

  static TextStyle heading5(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 20, color: color, fontWeight: FontWeight.w400);
  }

  static TextStyle subtitle1(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 18, color: color, fontWeight: FontWeight.w500);
  }

  static TextStyle subtitle2(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 16, color: color, fontWeight: FontWeight.w500);
  }

  static TextStyle subtitle3(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        decoration: TextDecoration.underline,
        fontSize: fontSize ?? 16,
        color: color,
        fontWeight: FontWeight.w500);
  }

  static TextStyle body1(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 18, color: color, fontWeight: FontWeight.w400);
  }

  static TextStyle body2(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 16, color: color, fontWeight: FontWeight.w400);
  }

  static TextStyle body3(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 14, color: color, fontWeight: FontWeight.w500);
  }

  static TextStyle appBar(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? 32,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w800,
    );
  }

  static TextStyle button(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 16, color: color, fontWeight: FontWeight.w600);
  }

  static TextStyle caption(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 12, color: color, fontWeight: FontWeight.w500);
  }
}

class BaseColor {
  static const Color black = Color(0xFF222222);
  static const Color white = Colors.deepOrangeAccent;
  static const Color hint = Color(0xFFA3A3A3);
  static const Color lightGrey = Color(0xFFF3F3F3);
  static const Color blue = Color(0xFF003399);
  static const Color secondaryBlue = Color(0xFFE5EEFF);
  static const Color off = Color(0xFFC3CAE9);
  static const Color orange = Color(0xFFFF9900);
  static const Color secondaryOrange = Color(0xFFFFF5E5);
  static const Color red = Color(0xFFD43513);
  static const Color secondaryRed = Color(0xFFFBEAE9);
  static const Color green = Color(0xFF00C11F);
  static const Color secondaryGreen = Color(0xFFE9FCEC);
}
