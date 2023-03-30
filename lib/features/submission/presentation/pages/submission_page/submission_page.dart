import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/bloc/submission_bloc.dart';
import 'package:tuterritorio/features/submission/presentation/pages/home_page/home_page.dart';
import 'package:tuterritorio/features/submission/presentation/pages/submission_page/top_search_bar.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/card_submission_widget/card_submission.dart';
import 'dart:developer' as developer;

import 'const/const.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({Key? key}) : super(key: key);

  @override
  State<SubmissionPage> createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [SearchBar(), SubmissionVerticalList()],
      )),
    );
  }
}

class SubmissionVerticalList extends StatefulWidget {
  SubmissionVerticalList({Key? key}) : super(key: key);

  @override
  State<SubmissionVerticalList> createState() => _SubmissionVerticalListState();
}

class _SubmissionVerticalListState extends State<SubmissionVerticalList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: PADDING_HORIZONTAL,
          right: PADDING_HORIZONTAL,
        ),
        child: BlocBuilder<SubmissionBloc, SubmissionState>(
            builder: (context, state) {
          if (state is Loaded) {
            return state.filterSubmissions.length == 0
                ? TitleSearchSub(
                    listLength: state.filterSubmissions.length,
                  )
                : ListView.builder(
                    itemCount: state.filterSubmissions.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      developer.log("building object $index");

                      if (index == 0) {
                        return Column(
                          children: [
                            TitleSearchSub(
                              listLength: state.filterSubmissions.length,
                            ),
                            SizedBox(
                              height: heightSubmissionCard,
                              width: double.infinity,
                              child: CardSubmission(
                                submission: state.filterSubmissions[index],
                              ),
                            )
                          ],
                        );
                      }
                      return SizedBox(
                        height: heightSubmissionCard,
                        child: CardSubmission(
                          submission: state.filterSubmissions[index],
                        ),
                      );
                    });
          }
          return Text(
            textLoading,
            style: Theme.of(context).textTheme.displayMedium,
          );
        }),
      ),
    );
  }
}

class TitleSearchSub extends StatelessWidget {
  const TitleSearchSub({Key? key, required this.listLength}) : super(key: key);
  final int listLength;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(
            top: PADDING_DEFAULT_DIV_2,
            bottom: PADDING_DEFAULT_DIV_2,
            left: PADDING_DEFAULT_DIV_2),
        child: Text(
          "$listLength propuestas encontradas",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

class _TopContainer extends StatelessWidget {
  const _TopContainer({
    Key? key,
    required this.showTopPadding,
  }) : super(key: key);

  final bool showTopPadding;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      height: showTopPadding ? PADDING_VERTICAL : 0,
      duration: Duration(milliseconds: 150),
    );
  }
}
