import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/const.dart';

import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/pages/filter_page/filter_page.dart';

import '../../bloc/submission_bloc.dart';
import 'const/const.dart';

class CategoriesSectionFilter extends StatefulWidget {
  const CategoriesSectionFilter({Key? key}) : super(key: key);

  @override
  State<CategoriesSectionFilter> createState() =>
      _CategoriesSectionFilterState();
}

class _CategoriesSectionFilterState extends State<CategoriesSectionFilter> {
  late String selectTag;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final SubmissionState state = context.read<SubmissionBloc>().state;

    if (state is Loaded) {
      selectTag = categoriesDataBuilder
          .firstWhere((element) => element.categoryValue == state.category)
          .nameOnUI;
    } else {
      selectTag = defaultCategoryValue;
    }

    super.didChangeDependencies();
  }

  handleOnSelectCategory(
      BuildContext context, FilterByCategoryData categoryBuilder) {
    final SubmissionState state = context.read<SubmissionBloc>().state;
    if (state is Loaded) {
      final List<Submission> submissions = state.submissions;
      context.read<SubmissionBloc>().add(FilterSubmissionsEvents(
            submissions: submissions,
            wordToSearch: '',
            orderBy: state.orderBy,
            categories: categoryBuilder.categoryValue,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textCategoriesSettings,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Wrap(
            children: List.generate(categoriesDataBuilder.length, (index) {
          return Padding(
            padding: index == 0
                ? const EdgeInsets.only(right: PADDING_DEFAULT_DIV_2)
                : const EdgeInsets.symmetric(horizontal: PADDING_DEFAULT_DIV_2),
            child: InkWell(
              onTap: (() {
                setState(() {
                  selectTag = categoriesDataBuilder[index].nameOnUI;
                  handleOnSelectCategory(context, categoriesDataBuilder[index]);
                });
              }),
              child: CategoryWidget(
                removeAvatar: categoriesDataBuilder[index]
                    .associatedDataOnUI
                    .toString()
                    .isEmpty,
                isPainted: categoriesDataBuilder[index].nameOnUI == selectTag,
                avatarURL: categoriesDataBuilder[index].associatedDataOnUI,
                text: categoriesDataBuilder[index].nameOnUI,
              ),
            ),
          );
        })),
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {Key? key,
      this.isPainted = false,
      this.removeAvatar = false,
      required this.text,
      required this.avatarURL})
      : super(key: key);
  final bool isPainted;
  final bool removeAvatar;
  final String text;
  final String avatarURL;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: removeAvatar
          ? null
          : CircleAvatar(
              backgroundImage: AssetImage(avatarURL),
            ),
      label: Text(
        text,
        style: isPainted
            ? TextStyle(color: Colors.white, fontSize: MEDIUM_SIZE_TEXT)
            : Theme.of(context).textTheme.titleMedium,
      ),
      side: isPainted
          ? const BorderSide(width: 1, color: SECONDARY_COLOR)
          : const BorderSide(width: 1, color: PRIMARY_COLOR),
      backgroundColor: isPainted ? SECONDARY_COLOR : Colors.white,
    );
  }
}
