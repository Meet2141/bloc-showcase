import 'package:bloc_showcase/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class TextWidgets extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final int? maxLines;

  const TextWidgets({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: textColor ?? ColorConstants.black,
      ),
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
