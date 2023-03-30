import 'package:tuterritorio/features/submission/data/models/submission_data.dart';

abstract class SubmissionLocalDataSource {
  Future<SubmissionModel> getSubmission();
}

class SubmissionLocalDataSourceImpl implements SubmissionLocalDataSource {
  @override
  Future<SubmissionModel> getSubmission() {
    // TODO: implement getSubmission
    throw UnimplementedError();
  }
}
