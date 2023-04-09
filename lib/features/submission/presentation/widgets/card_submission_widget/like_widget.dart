import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tuterritorio/core/theme/const.dart';

class LikeWidget extends StatefulWidget {
  LikeWidget({Key? key, required this.likes}) : super(key: key);
  final int likes;

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            isLiked = !isLiked;
          });
        },
        child: Row(
          children: [
            Icon(
              Icons.favorite,
              color: isLiked ? Colors.red : Colors.grey,
            ),
            const SizedBox(
              width: PADDING_DEFAULT_DIV_2,
            ),
            Text(
              widget.likes.toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ));
  }
}
