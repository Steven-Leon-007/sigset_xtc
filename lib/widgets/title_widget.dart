import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
      {required this.text,
      this.fgColor,
      this.textAlign,
      this.lineBreakCharacter = '_',
      this.fontSize,
      super.key});

  final String text;
  final Color? fgColor;
  final TextAlign? textAlign;
  final String lineBreakCharacter;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpans = text.split(lineBreakCharacter).map((segment) {
      bool isLastSegment = text.split(lineBreakCharacter).last == segment;

      return TextSpan(
        text: isLastSegment ? segment : '$segment\n',
        style: TextStyle(
          color: fgColor ?? Theme.of(context).colorScheme.primary,
          fontSize: fontSize ?? 36.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 4,
          fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
        ),
      );
    }).toList();

    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        children: textSpans,
      ),
    );
  }
}