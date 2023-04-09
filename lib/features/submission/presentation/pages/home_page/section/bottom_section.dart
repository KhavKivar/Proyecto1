import 'package:flutter/material.dart';
import 'package:tuterritorio/core/theme/const.dart';
import 'package:tuterritorio/core/theme/strings_app.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textRecentBallots,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              textSeeMore,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text("on"),
        ),
        FilledButton(
          onPressed: () {},
          child: Text("on"),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text("ds"),
        )
      ],
    );
  }
}
