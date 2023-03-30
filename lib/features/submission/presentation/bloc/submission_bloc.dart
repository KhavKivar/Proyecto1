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
      final OrderBy orderBy = event.orderBy;
      final Categories category = event.categories;
      //Firstly, we filter the list by word
      //Then we filter that list depend on filter that user has choose
      List<Submission> filterListGivenAWord =
          List<Submission>.from(submissions);
      if (word.isNotEmpty) {
        filterListGivenAWord = submissions
            .where((element) => element.title.toLowerCase().startsWith(word))
            .toList();
        print(event.submissions.length);
        print(filterListGivenAWord.length);
        List<Submission> filterList =
            filterListGivenX(filterListGivenAWord, orderBy, category);
        emit(Loaded(
            submissions: event.submissions,
            filterSubmissions: filterList,
            orderBy: event.orderBy,
            category: category));
      } else {
        List<Submission> filterList =
            filterListGivenX(event.submissions, orderBy, category);
        emit(Loaded(
            submissions: event.submissions,
            filterSubmissions: filterList,
            orderBy: event.orderBy,
            category: category));
      }
    });
  }
}

Map<Categories, String> categoryToString = {
  Categories.all: "todas las categorias",
  Categories.housing: "vivienda",
  Categories.security: "seguridad",
  Categories.sports: "deporte",
  Categories.publicSpace: "espacios publicos"
};

List<Submission> filterListGivenX(List<Submission> filterListGivenAWord,
    OrderBy orderBy, Categories categories) {
  List<Submission> filterList = filterListGivenAWord;
  // OrderBy
  switch (orderBy) {
    case OrderBy.news:
      filterList.sort((a, b) => a.date.compareTo(b.date));
      break;
    case OrderBy.popular:
      filterList.sort((a, b) => b.upVote.compareTo(a.upVote));
      break;
    default:
      break;
  }
  // By Categories
  switch (categories) {
    case Categories.all:
      break;
    default:
      filterList = filterList
          .where(
              (element) => element.tags.contains(categoryToString[categories]))
          .toList();
      break;
  }

  return filterList;
}

// 