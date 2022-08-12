import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';
import 'package:tuterritorio/features/submission/presentation/bloc/submission_bloc.dart';
import 'package:tuterritorio/features/submission/presentation/pages/home_page/home_page.dart';
import 'package:tuterritorio/features/submission/presentation/pages/submission_page/top_section.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/card_submission.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({Key? key}) : super(key: key);

  @override
  State<SubmissionPage> createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  final String textLoading = "loading..";
  late ScrollController _controller;

  final double containerHeightValue = 45.0;
  late var containerHeight = containerHeightValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.removeListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
      if (containerHeight != 0) {
        setState(() {
          containerHeight = 0;
        });
      }
    }
    if (_controller.position.userScrollDirection == ScrollDirection.forward) {
      if (containerHeight == 0) {
        setState(() {
          containerHeight = containerHeightValue;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PADDING_HORIZONTAL, vertical: PADDING_VERTICAL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWidget(),
            if (containerHeight == 0)
              SizedBox(
                height: PADDING_VERTICAL,
              ),
            AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                height: containerHeight,
                child: Categories()),
            BlocBuilder<SubmissionBloc, SubmissionState>(
                builder: (context, state) {
              if (state is Loaded) {
                return Expanded(
                  child: ListView.builder(
                      controller: _controller,
                      itemCount: state.submissions.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 250,
                          child: CardSubmission(
                            submission: state.submissions[index],
                          ),
                        );
                      }),
                );
              }
              return TextBlue(
                text: textLoading,
              );
            }),
          ],
        ),
      )),
    );
  }
}
