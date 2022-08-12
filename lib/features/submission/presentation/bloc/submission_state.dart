part of 'submission_bloc.dart';

abstract class SubmissionState extends Equatable {
  const SubmissionState();

  @override
  List<Object> get props => [];
}

class Empty extends SubmissionState {}

class Loading extends SubmissionState {}

class Loaded extends SubmissionState {
  final List<Submission> submissions;
  const Loaded({
    required this.submissions,
  });
}

class Error extends SubmissionState {
  final String message;
  const Error({
    required this.message,
  });
}
