import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tuterritorio/features/submission/data/models/submission_data.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/get_submission.dart';

part 'submission_event.dart';
part 'submission_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class SubmissionBloc extends Bloc<SubmissionEvent, SubmissionState> {
  final GetSubmission getSubmission;

  @override
  SubmissionBloc({required this.getSubmission}) : super(Empty()) {
    on<GetSubmissions>((event, emit) async {
      emit(Loading());
      final Either<Failure, List<Submission>> failureOrSubmissions =
          await getSubmission();

      failureOrSubmissions.fold((l) {
        print("error");
        emit(Error(message: SERVER_FAILURE_MESSAGE));
      }, (r) {
        emit(Loaded(submissions: r, filterSubmissions: r));
      });
    });

    on<FilterSubmissionsEvents>((event, emit) async {
      final String word = event.wordToSearch.toLowerCase();
      final List<Submission> submissions = event.submissions;

      if (word.isNotEmpty) {
        final List<Submission> filterList = submissions
            .where((element) => element.title.toLowerCase().startsWith(word))
            .toList();
        print(event.submissions.length);
        print(filterList.length);
        emit(Loaded(
            submissions: event.submissions, filterSubmissions: filterList));
      } else {
        emit(Loaded(submissions: submissions, filterSubmissions: submissions));
      }
    });
  }
}
