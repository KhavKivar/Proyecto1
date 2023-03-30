import 'package:flutter/material.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';
import 'package:tuterritorio/features/submission/presentation/pages/home_page/const/const.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textRecentBallots,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          textSeeMore,
          style: Theme.of(context).textTheme.displayMedium,
        )
      ],
    );
  }
}
