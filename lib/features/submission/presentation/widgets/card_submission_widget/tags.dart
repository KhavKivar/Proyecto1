import 'package:flutter/material.dart';
import 'package:tuterritorio/core/const.dart';

class Tag extends StatelessWidget {
  const Tag({Key? key, required this.tag, required this.img}) : super(key: key);
  final String tag;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      avatar: CircleAvatar(
        backgroundImage: AssetImage(img),
      ),
      label: Text(
        tag,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
