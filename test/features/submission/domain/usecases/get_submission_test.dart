import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tuterritorio/features/submission/domain/repositories/submission_repository.dart';
import 'package:tuterritorio/features/submission/domain/usecases/get_submission.dart';

class MockSubmissionRepository extends Mock implements SubmissionRepository {
  @override
  Future<Either<Failure, Submission>> getSubmission() {
    // TODO: implement getSubmission
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Submission>> getSubmissionById(String id) {
    // TODO: implement getSubmissionById
    throw UnimplementedError();
  }
}

void main() {
  GetSubmission usecase;
  MockSubmissionRepository mockSubmissionRepository;

  setUp(() {
    mockSubmissionRepository = MockSubmissionRepository();
    usecase = GetSubmission(mockSubmissionRepository);
  });

  // test('should get submission from the repository', () async {
  //   when(mockSubmissionRepository.getSubmission())
  //       .thenAnswer((_) async => Right(Submission(
  //             idSubmission: '1',
  //             title: 'Titulo 1',
  //             description: 'Descripcion 1',
  //             tags: ['tag1', 'tag2'],
  //             upVote: 1,
  //             downVote: 0,
  //             state: 'state1',
  //             imageUrl: 'https://picsum.photos/seed/picsum/200/300',
  //             idUser: 'idUser1',
  //             userName: 'userName1',
  //             date: 'date1',
  //           )));
  // });
}
