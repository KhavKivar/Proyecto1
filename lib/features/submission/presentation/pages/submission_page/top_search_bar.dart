import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';
import 'package:tuterritorio/features/submission/data/models/submission_data.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/bloc/submission_bloc.dart';

import 'const/const.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.only(
            left: PADDING_HORIZONTAL,
            right: PADDING_HORIZONTAL,
            bottom: PADDING_VERTICAL - 2),
        child: Column(
          children: const [
            SearchBarTitleWidget(
              title: textTitleOnSubPage,
            ),
            SearchWidget()
          ],
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  handleOnSearchAction(BuildContext context, value) {
    final SubmissionState state = context.read<SubmissionBloc>().state;
    if (state is Loaded) {
      final List<Submission> submissions = state.submissions;
      context.read<SubmissionBloc>().add(FilterSubmissionsEvents(
          submissions: submissions,
          wordToSearch: value,
          orderBy: state.orderBy,
          categories: state.category));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BORDER_RADIUS_BIG),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.grey, spreadRadius: 1),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PADDING_DEFAULT, vertical: 0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: PRIMARY_COLOR,
                  ),
                  const SizedBox(
                    width: PADDING_DEFAULT,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        handleOnSearchAction(context, value);
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: textSearchOnAppBar,
                          isDense: true),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  routeSubmissionFilter,
                );
              },
              child: const Icon(
                Icons.filter_list_rounded,
                color: PRIMARY_COLOR,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchBarTitleWidget extends StatelessWidget {
  const SearchBarTitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightTopTitleContainer,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: InkWell(
              onTap: () {
                Navigator.maybePop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: PRIMARY_COLOR,
              ),
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
