import 'package:flutter/material.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  final String textPopularSubmission = "Propuestas populares";
  final String textWelcome = "Bienvenido!";
  final String textUserName = "Lorem Isum";
  final String textSeeMore = "Ver mas";
  final double avatarWidth = 40;
  final double avatarHeight = 40;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextPrimary(
                text: textWelcome,
                fontSize: LARGE_SIZE_TEXT,
              ),
              TextGrey(
                text: textUserName,
                fontSize: NORMAL_SIZE_TEXT,
              ),
            ],
          ),
          Image.asset(
            'assets/images/avatar.png',
            fit: BoxFit.scaleDown,
            width: avatarWidth,
            height: avatarHeight,
          ),
        ],
      ),
      SizedBox(
        height: PADDING_VERTICAL,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextPrimary(
            text: textPopularSubmission,
            fontSize: NORMAL_SIZE_TEXT,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                routeSubmission,
              );
            },
            child: TextBlue(
              text: textSeeMore,
            ),
          )
        ],
      ),
    ]);
  }
}
