part of 'submission_bloc.dart';

abstract class SubmissionEvent extends Equatable {
  const SubmissionEvent();

  @override
  List<Object> get props => [];
}

class GetSubmissions extends SubmissionEvent {}

class FilterSubmissionsEvents extends SubmissionEvent {
  const FilterSubmissionsEvents(
      {required this.submissions,
      required this.wordToSearch,
      this.orderBy = OrderBy.trending,
      this.categories = Categories.all});

  final String wordToSearch;
  final List<Submission> submissions;
  final OrderBy orderBy;
  final Categories categories;
}
