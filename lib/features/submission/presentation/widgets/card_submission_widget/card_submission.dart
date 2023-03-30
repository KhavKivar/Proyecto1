import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/plataform/strings_capitalize.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/card_submission_widget/tags.dart';

import '../../../domain/entities/submission.dart';
import 'const.dart';

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
      child: CachedNetworkImage(
        imageUrl: submission.imageUrl,
        placeholder: (context, url) {
          return const SizedBox(
              width: widthContainer,
              child: Center(child: CircularProgressIndicator()));
        },
        errorWidget: (context, url, error) => Icon(Icons.error),
        imageBuilder: (context, imageProvider) {
          return CardSubmissionBody(
            submission: submission,
          );
        },
      ),
    );
  }
}

class CardSubmissionBody extends StatelessWidget {
  const CardSubmissionBody({Key? key, required this.submission})
      : super(key: key);
  final Submission submission;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthContainer,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    submission.imageUrl,
                  ))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardTopContent(submission: submission),
              Column(
                children: [
                  CardTagContent(submission: submission),
                  CardInfoContent(submission: submission),
                ],
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BORDER_RADIUS_SMALL),
        ),
        elevation: ELEVATION_DEFAULT,
      ),
    );
  }
}

class CardInfoContent extends StatelessWidget {
  const CardInfoContent({
    Key? key,
    required this.submission,
  }) : super(key: key);

  final Submission submission;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: PADDING_DEFAULT,
          right: PADDING_DEFAULT,
          bottom: PADDING_DEFAULT),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS_SMALL),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(PADDING_DEFAULT),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                submission.title,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        defaultAvatarSrc,
                        fit: BoxFit.scaleDown,
                        width: avatarWidth,
                        height: avatarHeight,
                      ),
                      const SizedBox(
                        width: PADDING_VERTICAL,
                      ),
                      Text(
                        userName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Text(
                    submission.date,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTagContent extends StatelessWidget {
  const CardTagContent({
    Key? key,
    required this.submission,
  }) : super(key: key);

  final Submission submission;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: PADDING_DEFAULT),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: submission.tags.map((e) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: PADDING_DEFAULT_DIV_2),
            child: Tag(
                tag: e.capitalize(),
                img: tagDataBuilder
                        .firstWhere((element) => element.nameOnUI == e)
                        .associatedDataOnUI ??
                    defaultErrorTag),
          );
        }).toList(),
      ),
    );
  }
}

class CardTopContent extends StatelessWidget {
  const CardTopContent({
    Key? key,
    required this.submission,
  }) : super(key: key);

  final Submission submission;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PADDING_DEFAULT),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(BORDER_RADIUS_SMALL),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: PADDING_DEFAULT_DIV_2 + 1,
                  horizontal: PADDING_DEFAULT_DIV_2 + 1),
              child: Text(
                "${submission.upVote} Interesados",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(BORDER_RADIUS_BIG),
            ),
            child: Padding(
              padding: const EdgeInsets.all(PADDING_DEFAULT_DIV_2),
              child: LikeButton(
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite_rounded,
                    color: isLiked ? Colors.redAccent : Colors.grey,
                    size: BORDER_RADIUS_BIG,
                  );
                },
                likeCountPadding: const EdgeInsets.only(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
