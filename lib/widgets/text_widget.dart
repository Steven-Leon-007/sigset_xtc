import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {required this.text,
      this.fgColor,
      this.textAlign,
      this.fontSize,
      super.key,
      this.fontWeight});

  final String text;
  final Color? fgColor;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fgColor ?? Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
