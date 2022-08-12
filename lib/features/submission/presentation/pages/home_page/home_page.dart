import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';
import 'package:tuterritorio/features/submission/data/models/submission_data.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/bloc/submission_bloc.dart';
import 'package:tuterritorio/features/submission/presentation/pages/home_page/top_section.dart';
import 'package:tuterritorio/features/submission/presentation/pages/home_page/utils.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/card_submission.dart';
import 'package:tuterritorio/inject_container.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String textRecentBallots = "Encuestas recientes";
  final String textSeeMore = "Ver mas";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: PADDING_HORIZONTAL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopSection(),
            BlocBuilder<SubmissionBloc, SubmissionState>(
                builder: (context, state) {
              if (state is Empty) {
                context.read<SubmissionBloc>().add(GetSubmissions());
                return MessageDisplay(message: 'Start searching');
              } else if (state is Loading) {
                return LoadingWidget();
              } else if (state is Loaded) {
                return Flexible(
                    child: ViewCard(
                  submissions: state.submissions,
                  scrollType: Axis.horizontal,
                ));
              } else if (state is Error) {
                return MessageDisplay(message: state.message);
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: const Placeholder(),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextPrimary(
                  text: textRecentBallots,
                  fontSize: NORMAL_SIZE_TEXT,
                ),
                TextBlue(
                  text: textSeeMore,
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class ViewCard extends StatelessWidget {
  const ViewCard(
      {Key? key, required this.submissions, required this.scrollType})
      : super(key: key);
  final List<Submission> submissions;
  final Axis scrollType;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
          scrollDirection: scrollType,
          itemCount: submissions.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CardSubmission(
              submission: submissions[index],
            );
          }),
    );
  }
}