import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/plataform/strings_capitalize.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_bloc.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_state.dart';
import 'package:tuterritorio/core/theme/const.dart';
import 'package:tuterritorio/core/theme/strings_app.dart';
import 'package:tuterritorio/core/theme/theme.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/card_submission_widget/utils.dart';
import 'package:tuterritorio/main.dart';

class CardTagContent extends StatelessWidget {
  const CardTagContent({
    Key? key,
    required this.tags,
    required this.mainAxisAlignment,
  }) : super(key: key);

  final List<String> tags;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: PADDING_DEFAULT),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: tags.map((e) {
          return Padding(
            padding: tags.indexOf(e) == 0
                ? EdgeInsets.only(right: PADDING_DEFAULT_DIV_2)
                : EdgeInsets.symmetric(horizontal: PADDING_DEFAULT_DIV_2),
            child: Tag(
                tag: e.capitalize(),
                img: tagDataBuilder
                        .firstWhere((element) => element.nameOnUI == e)
                        .associatedDataOnUI ??
                    defaultErrorTag),
          );
        }).toList(),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({Key? key, required this.tag, required this.img}) : super(key: key);
  final String tag;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.zero,
      backgroundColor: isDark(context) ? SURFACE_COLOR_DARK : Colors.white,
      avatar: CircleAvatar(
        backgroundColor: isDark(context) ? SURFACE_COLOR_DARK : PRIMARY_COLOR,
        backgroundImage: AssetImage(img),
      ),
      label: Text(
        tag,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
