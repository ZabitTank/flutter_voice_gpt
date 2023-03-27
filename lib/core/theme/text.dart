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
