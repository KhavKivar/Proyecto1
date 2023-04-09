import 'package:equatable/equatable.dart';

class Submission extends Equatable {
  String idSubmission;
  String title;
  String description;
  List<String> tags = [];
  int upVote;
  int downVote;
  String state;
  List<String> imageUrl = [];
  String idUser;
  String userName;
  String date;

  Submission({
    required this.idSubmission,
    required this.title,
    required this.description,
    required this.tags,
    required this.upVote,
    required this.downVote,
    required this.state,
    required this.imageUrl,
    required this.idUser,
    required this.userName,
    required this.date,
  });

  @override
  List<Object> get props {
    return [
      idSubmission,
      title,
      description,
      tags,
      upVote,
      downVote,
      state,
      imageUrl,
      idUser,
      userName,
      date,
    ];
  }

  @override
  String toString() {
    return 'Submission(idSubmission: $idSubmission, title: $title, description: $description, tags: $tags, upVote: $upVote, downVote: $downVote, state: $state, imageUrl: $imageUrl, idUser: $idUser, userName: $userName, date: $date)';
  }
}
