import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_bloc.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_event.dart';
import 'package:tuterritorio/core/theme/const.dart';
import 'package:tuterritorio/core/theme/strings_app.dart';
import 'package:tuterritorio/main.dart';

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
        OutlinedButton(
            onPressed: () {
              final bloc = context.read<ThemeBloc>();
              if (isDark(context)) {
                bloc.add(ThemeChanged(theme: ThemeAppEnum.light));
              } else {
                bloc.add(ThemeChanged(theme: ThemeAppEnum.dark));
              }
            },
            child: isDark(context)
                ? Icon(Icons.sunny)
                : Icon(Icons.nightlight_round))
      ],
    );
  }
}
