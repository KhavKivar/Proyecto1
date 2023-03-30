import 'package:flutter/material.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';

import '../const/const.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textWelcome,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                textUserName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          Image.asset(
            assetDefaultAvatar,
            fit: BoxFit.scaleDown,
            width: avatarWidth,
            height: avatarHeight,
          ),
        ],
      ),
      const SizedBox(
        height: PADDING_VERTICAL,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textPopularSubmission,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                routeSubmission,
              );
            },
            child: Text(
              textSeeMore,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    ]);
  }
}
