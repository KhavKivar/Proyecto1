import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_bloc.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_event.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_state.dart';
import 'package:tuterritorio/core/theme/const.dart';
import 'package:tuterritorio/core/theme/strings_app.dart';
import 'package:tuterritorio/core/theme/theme.dart';
import 'package:tuterritorio/features/submission/data/models/submission_data.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/bloc/submission_bloc.dart';
import 'package:tuterritorio/features/submission/presentation/pages/home_page/section/bottom_section.dart';
import 'package:tuterritorio/features/submission/presentation/pages/home_page/section/top_section.dart';
import 'package:tuterritorio/features/submission/presentation/pages/home_page/utils.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/card_submission_widget/card_submission.dart';
import 'package:tuterritorio/inject_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuterritorio/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PADDING_HORIZONTAL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopSection(),
            SubmissionListCardWidget(),
            BottomSection(),
          ],
        ),
      ),
    ));
  }
}

class SubmissionListCardWidget extends StatelessWidget {
  const SubmissionListCardWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmissionBloc, SubmissionState>(
        builder: (context, state) {
      if (state is Empty) {
        context.read<SubmissionBloc>().add(GetSubmissions());

        return const MessageDisplay(message: textStartSearch);
      } else if (state is Loading) {
        return const LoadingWidget();
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
    });
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
    return SizedBox(
      height: heightSubmissionCard,
      child: ListView.builder(
          scrollDirection: scrollType,
          itemCount: submissions.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: PADDING_DEFAULT,
                  top: PADDING_DEFAULT_DIV_2,
                  bottom: PADDING_DEFAULT_DIV_2),
              child: CardSubmission(
                submission: submissions[index],
              ),
            );
          }),
    );
  }
}
