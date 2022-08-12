import 'package:flutter/material.dart';
import 'package:tuterritorio/core/const.dart';

class TextPrimary extends StatelessWidget {
  const TextPrimary(
      {Key? key,
      required this.text,
      this.fontSize = NORMAL_SIZE_TEXT,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);
  final String text;
  final double fontSize;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: DARK_GRAY,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            overflow: textOverflow));
  }
}

class TextWhite extends StatelessWidget {
  const TextWhite(
      {Key? key,
      required this.text,
      this.fontSize = NORMAL_SIZE_TEXT,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);
  final String text;
  final double fontSize;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            overflow: textOverflow));
  }
}

class TextGrey extends StatelessWidget {
  const TextGrey({Key? key, required this.text, required this.fontSize})
      : super(key: key);
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: Colors.grey,
            fontSize: fontSize,
            fontWeight: FontWeight.w600));
  }
}

class TextBlue extends StatelessWidget {
  const TextBlue({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            color: PRIMARY_COLOR,
            fontSize: NORMAL_SIZE_TEXT,
            fontWeight: FontWeight.w600));
  }
}
