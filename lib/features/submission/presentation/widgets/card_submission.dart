import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/tags.dart';

import '../../domain/entities/submission.dart';

class CardSubmission extends StatelessWidget {
  const CardSubmission({Key? key, required this.submission}) : super(key: key);
  final Submission submission;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          routeSubmissionDetails,
          arguments: submission,
        );
      },
      child: Container(
        width: 300,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      submission.imageUrl,
                    ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: TextPrimary(
                            fontSize: SMALL_SIZE_TEXT,
                            text: "${submission.upVote} Interesados",
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: LikeButton(
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                Icons.favorite_rounded,
                                color: isLiked ? Colors.redAccent : Colors.grey,
                                size: 25,
                              );
                            },
                            likeCountPadding: const EdgeInsets.only(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextPrimary(
                            text: submission.title,
                            fontSize: NORMAL_SIZE_TEXT,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/avatar.png',
                                    fit: BoxFit.scaleDown,
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextPrimary(
                                    text: "Lorem Isum",
                                    fontSize: SMALL_SIZE_TEXT,
                                  ),
                                ],
                              ),
                              TextGrey(
                                text: submission.date,
                                fontSize: SMALL_SIZE_TEXT,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
        ),
      ),
    );
  }
}
