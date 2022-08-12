part of 'submission_bloc.dart';

abstract class SubmissionEvent extends Equatable {
  const SubmissionEvent();

  @override
  List<Object> get props => [];
}

class GetSubmissions extends SubmissionEvent {}
