import 'dart:convert';

import 'package:tuterritorio/features/submission/domain/entities/submission.dart';

class SubmissionModel extends Submission {
  SubmissionModel(
      {required String idSubmission,
      required String title,
      required String description,
      required List<String> tags,
      required int upVote,
      required int downVote,
      required String state,
      required String imageUrl,
      required String idUser,
      required String userName,
      required String date})
      : super(
            idSubmission: idSubmission,
            title: title,
            description: description,
            tags: tags,
            upVote: upVote,
            downVote: downVote,
            state: state,
            imageUrl: imageUrl,
            idUser: idUser,
            userName: userName,
            date: date);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'idSubmission': idSubmission});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'tags': tags});
    result.addAll({'upVote': upVote});
    result.addAll({'downVote': downVote});
    result.addAll({'state': state});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'idUser': idUser});
    result.addAll({'userName': userName});
    result.addAll({'date': date});
    return result;
  }

  String toJson() => json.encode(toMap());

  factory SubmissionModel.fromMap(Map<String, dynamic> map) {
    return SubmissionModel(
      idSubmission: map['idSubmission'].toString(),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      tags: List<String>.from(map['tags'] ?? []),
      upVote: map['upVote']?.toInt() ?? 0,
      downVote: map['downVote']?.toInt() ?? 0,
      state: map['state'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      idUser: map['idUser'] ?? '',
      userName: map['userName'] ?? '',
      date: map['date'] ?? '',
    );
  }
  factory SubmissionModel.fromJson(Map<String, dynamic> source) =>
      SubmissionModel.fromMap(source);
}
