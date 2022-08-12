import 'package:dartz/dartz.dart';
import 'package:tuterritorio/core/error/failures.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';

abstract class SubmissionRepository {
  Future<Either<Failure, List<Submission>>> getSubmission();

  Future<Either<Failure, Submission>> getSubmissionById(String id);
  Future<Either<Failure, Submission>> createSubmission(Submission submission);
  Future<Either<Failure, Submission>> updateSubmission(Submission submission);
  Future<Either<Failure, Submission>> deleteSubmissionById(String id);
}
