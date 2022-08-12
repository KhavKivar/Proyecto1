import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tuterritorio/features/submission/data/models/submission_data.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tSubmissionModel = SubmissionModel(
    idSubmission: '131',
    description: 'test description',
    title: 'test title',
    imageUrl: 'img.cl',
    state: 'state',
    tags: ["tag1", "tag2"],
    upVote: 10,
    downVote: 0,
    idUser: "a31",
    userName: 'Username',
    date: '1312-12-12',
  );
  group('fromJson', () {
    test('should return a SubmissionModel object when proper data is used', () {
      final String jsonString = fixture('submission.json');
      final result = SubmissionModel.fromJson(jsonString);
      expect(result, tSubmissionModel);
    });

    test('should return a SubmissionModel object when idSubmission is int', () {
      final String jsonString = fixture('submission_double.json');
      final result = SubmissionModel.fromJson(jsonString);
      expect(result, tSubmissionModel);
    });
  });
}
