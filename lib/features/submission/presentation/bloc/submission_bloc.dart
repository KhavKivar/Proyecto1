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
      await Future.delayed(Duration(seconds: 1));

      failureOrSubmissions.fold((l) {
        print("error");
        emit(Error(message: SERVER_FAILURE_MESSAGE));
      }, (r) {
        emit(Loaded(submissions: r));
      });
    });
  }
}
