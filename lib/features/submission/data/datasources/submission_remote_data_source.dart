import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/error/exceptions.dart';
import 'package:tuterritorio/core/error/failures.dart';
import 'package:tuterritorio/features/submission/data/models/submission_data.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/submission.dart';

abstract class SubmissionRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<SubmissionModel>> getSubmission();
}

class SubmissionRemoteDataSourceImpl implements SubmissionRemoteDataSource {
  final http.Client client;
  SubmissionRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SubmissionModel>> getSubmission() =>
      getSubmissionFromUrl(getSubmissionUrl);

  Future<List<SubmissionModel>> getSubmissionFromUrl(String url) async {
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        return List<SubmissionModel>.from(
            json.decode(response.body).map((x) => SubmissionModel.fromJson(x)));
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
