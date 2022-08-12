import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton(
      {Key? key,
      required this.icon,
      required this.count,
      required this.iconColor})
      : assert(icon != null, 'Icon cant be null'),
        super(key: key);
  final icon;
  final int count;
  final iconColor;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        IconButton(
          icon: Icon(widget.icon),
          color: _isLiked ? widget.iconColor : Colors.grey,
          onPressed: () {},
        ),
        Text(widget.count.toString()),
      ],
    );
  }
}
