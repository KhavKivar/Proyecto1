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
  final List<Submission> filterSubmissions;
  const Loaded({required this.filterSubmissions, required this.submissions});
  @override
  List<Object> get props => [submissions, filterSubmissions];
}

class Error extends SubmissionState {
  final String message;
  const Error({
    required this.message,
  });
}
