import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';

InputDecoration textInputDecoration({
  String? hintText,
  String? helperText,
  Color? fillColor,
  int? errorMaxLines,
  bool? isFilled,
  bool? left,
  bool? right,
  Color? colorBorder,
  Color? enableColorBorder,
  Widget? suffixIcon,
  Widget? prefixIcon,
  Widget? icon,
  InputBorder? border,
  EdgeInsetsGeometry? contentPadding,
}) {
  return InputDecoration(
    icon: icon,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    border: border,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    fillColor: fillColor,
    hintText: hintText,
    helperText: helperText,
    hintStyle: textHintStyle(),
    filled: isFilled ?? false,
    errorMaxLines: errorMaxLines,
    contentPadding: contentPadding ?? EdgeInsets.fromLTRB(16, 12, 16, 12),
    focusedBorder: outlineInputBorder(
      color: enableColorBorder,
      left: left ?? false,
      right: right ?? false,
    ),
    enabledBorder: outlineInputBorder(
      color: colorBorder,
      left: left ?? false,
      right: right ?? false,
    ),
    focusedErrorBorder: errorOutlineInputBorder(
      left: left ?? false,
      right: right ?? false,
    ),
    errorBorder: errorOutlineInputBorder(
      left: left ?? false,
      right: right ?? false,
    ),
    errorStyle: textErrorTextFieldStyle(),
  );
}
