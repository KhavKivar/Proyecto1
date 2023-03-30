import 'package:http/http.dart';
import 'package:tuterritorio/core/error/exceptions.dart';
import 'package:tuterritorio/core/plataform/network_info.dart';
import 'package:tuterritorio/features/submission/data/datasources/submission_local_data_source.dart';
import 'package:tuterritorio/features/submission/data/datasources/submission_remote_data_source.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';

import 'package:tuterritorio/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/submission_repository.dart';

class SubmissionRepositoryImpl implements SubmissionRepository {
  final SubmissionLocalDataSource submissionLocalDataSource;
  final SubmissionRemoteDataSource submissionRemoteDataSource;
  final NetworkInfo networkInfo;
  SubmissionRepositoryImpl(
      {required this.submissionLocalDataSource,
      required this.submissionRemoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Submission>>> getSubmission() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSubmission =
            await submissionRemoteDataSource.getSubmission();
        return Right(remoteSubmission);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, Submission>> createSubmission(Submission submission) {
    // TODO: implement createSubmission
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Submission>> deleteSubmissionById(String id) {
    // TODO: implement deleteSubmissionById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Submission>> getSubmissionById(String id) {
    // TODO: implement getSubmissionById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Submission>> updateSubmission(Submission submission) {
    // TODO: implement updateSubmission
    throw UnimplementedError();
  }
}
