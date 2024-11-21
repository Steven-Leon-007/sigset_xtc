import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {required this.text,
      this.fgColor,
      this.textAlign,
      this.fontSize,
      super.key});

  final String text;
  final Color? fgColor;
  final TextAlign? textAlign;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fgColor ?? Colors.black,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
