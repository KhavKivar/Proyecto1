import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_bloc.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_state.dart';
import 'package:tuterritorio/core/theme/const.dart';
import 'package:tuterritorio/core/plataform/strings_capitalize.dart';
import 'package:tuterritorio/core/theme/strings_app.dart';
import 'package:tuterritorio/core/theme/theme.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/card_submission_widget/tags.dart';
import 'package:tuterritorio/main.dart';

import '../../../domain/entities/submission.dart';
import 'utils.dart';

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
        imageUrl: submission.imageUrl[0],
        placeholder: (context, url) {
          return SizedBox(
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

class CardSubmissionBody extends StatefulWidget {
  const CardSubmissionBody({Key? key, required this.submission})
      : super(key: key);
  final Submission submission;

  @override
  State<CardSubmissionBody> createState() => _CardSubmissionBodyState();
}

class _CardSubmissionBodyState extends State<CardSubmissionBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthContainer,
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BlocListener<ThemeBloc, ThemeState>(
          listener: (context, state) {
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: isDark(context)
                        ? ColorFilter.mode(Colors.black26, BlendMode.darken)
                        : null,
                    image: CachedNetworkImageProvider(
                      widget.submission.imageUrl[0],
                    ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardTopContent(submission: widget.submission),
                Column(
                  children: [
                    CardTagContent(
                      tags: widget.submission.tags,
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                    CardInfoContent(submission: widget.submission),
                  ],
                )
              ],
            ),
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
          color: isDark(context) ? SURFACE_COLOR_DARK : BACKGROUND_COLOR,
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
                        width: avatarWidthMedium,
                        height: avatarHeightMedium,
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
              color: isDark(context) ? SURFACE_COLOR_DARK : BACKGROUND_COLOR,
              borderRadius: BorderRadius.circular(BORDER_RADIUS_SMALL),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: PADDING_DEFAULT_DIV_2 + 1,
                  horizontal: PADDING_DEFAULT_DIV_2 + 1),
              child: Text(
                "${submission.upVote}" " " + textLikes,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isDark(context) ? SURFACE_COLOR_DARK : BACKGROUND_COLOR,
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
