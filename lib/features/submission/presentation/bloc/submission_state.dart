part of 'submission_bloc.dart';

//enum filter options
enum OrderBy {
  trending,
  popular,
  mostCommented,
  news,
}

enum Categories {
  all,
  housing,
  security,
  sports,
  publicSpace,
}

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
  final OrderBy orderBy;
  final Categories category;

  const Loaded(
      {required this.filterSubmissions,
      required this.submissions,
      this.orderBy = OrderBy.trending,
      this.category = Categories.all});
  @override
  List<Object> get props => [submissions, filterSubmissions, orderBy, category];
}

class Error extends SubmissionState {
  final String message;
  const Error({
    required this.message,
  });
}
