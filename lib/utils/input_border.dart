import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';

InputBorder errorOutlineInputBorder({double? width, bool? left, bool? right}) {
  return OutlineInputBorder(
    borderRadius: left ?? false
        ? BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          )
        : right ?? false
            ? BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )
            : BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Colors.red,
      width: width ?? 1.0,
    ),
  );
}

InputBorder outlineInputBorder({double? width, Color? color, bool? left, bool? right}) {
  return OutlineInputBorder(
    borderRadius: left ?? false
        ? BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          )
        : right ?? false
            ? BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )
            : BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color ?? neutral70,
    ),
  );
}
