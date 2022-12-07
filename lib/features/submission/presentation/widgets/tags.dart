import 'package:flutter/material.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';

class Tag extends StatelessWidget {
  const Tag({Key? key, required this.tag, required this.img}) : super(key: key);
  final String tag;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.zero,
      avatar: CircleAvatar(
        backgroundImage: AssetImage(img),
      ),
      label: TextPrimary(
        text: tag,
        fontSize: SMALL_SIZE_TEXT,
      ),
    );
  }
}
