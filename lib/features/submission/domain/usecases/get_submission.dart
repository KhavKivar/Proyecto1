import 'package:dartz/dartz.dart';
import 'package:tuterritorio/core/error/failures.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/domain/repositories/submission_repository.dart';

class GetSubmission {
  final SubmissionRepository submissionRepository;
  GetSubmission({required this.submissionRepository});

  Future<Either<Failure, List<Submission>>> call() {
    return submissionRepository.getSubmission();
  }
}
