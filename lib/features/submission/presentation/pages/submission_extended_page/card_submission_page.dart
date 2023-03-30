import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/card_submission_widget/const.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/card_submission_widget/tags.dart';
import 'dart:developer' as developer;

class CardSubmissionDetailsPage extends StatelessWidget {
  const CardSubmissionDetailsPage({Key? key, required this.submission})
      : super(key: key);
  final Submission submission;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverDelegate(
                maxExtend: MediaQuery.of(context).size.height,
                minExtend: 240,
                builder: (percent) {
                  return AnimatedImageHeader(
                    submission: submission,
                    bottomPercent: ((percent) / 0.3).clamp(0, 1),
                    topPercent: ((1 - percent) / 0.7).clamp(0, 1),
                  );
                }),
          ),
          SliverToBoxAdapter(
            child: BottomContainer(submission: submission),
          ),
        ],
      ),
    );
  }
}

class BottomContentBar extends StatelessWidget {
  const BottomContentBar({Key? key, required this.submission})
      : super(key: key);
  final Submission submission;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _UserContent(
          publishDate: submission.date,
          userName: submission.userName,
        ),
        _LikeWidget(submission.upVote),
      ],
    );
  }
}

class _UserContent extends StatelessWidget {
  final String userName;
  final String publishDate;
  const _UserContent(
      {Key? key, required this.userName, required this.publishDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              publishDate,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ],
    );
  }
}

class _LikeWidget extends StatelessWidget {
  const _LikeWidget(this.likes);
  final int likes;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      likeCount: likes,
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite_rounded,
          color: isLiked ? Colors.redAccent : Colors.grey,
          size: BORDER_RADIUS_BIG,
        );
      },
      likeCountPadding: const EdgeInsets.only(),
    );
  }
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text(
            textComment,
          ),
        )
      ],
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({required this.submission});
  final Submission submission;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(BORDER_RADIUS_BIG),
              topRight: Radius.circular(BORDER_RADIUS_BIG),
            ),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: EdgeInsets.all(PADDING_HORIZONTAL),
            child: Column(
              children: [
                Text(submission.title,
                    style: Theme.of(context).textTheme.titleMedium),
                Text(submission.description,
                    style: Theme.of(context).textTheme.titleSmall)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedImageHeader extends StatelessWidget {
  const AnimatedImageHeader({
    Key? key,
    required this.submission,
    required this.topPercent,
    required this.bottomPercent,
  }) : super(key: key);

  final Submission submission;
  final double topPercent;
  final double bottomPercent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 70 * (1 - bottomPercent),
            ),
            child: Transform.scale(
              scale: lerpDouble(1, 1.3, bottomPercent),
              child: PlaceImageWidget(submission: submission),
            ),
          ),
        ),
        Positioned.fill(
          top: null,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(BORDER_RADIUS_BIG),
                topRight: Radius.circular(BORDER_RADIUS_BIG),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(PADDING_HORIZONTAL),
              child: Column(
                children: [
                  BottomContentBar(
                    submission: submission,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PlaceImageWidget extends StatelessWidget {
  const PlaceImageWidget({
    Key? key,
    required this.submission,
  }) : super(key: key);

  final Submission submission;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: PADDING_DEFAULT,
        ),
        Expanded(
          child: SafeArea(
            child: PageView(
                scrollDirection: Axis.horizontal,
                controller: PageController(viewportFraction: 0.9),
                children: List.generate(
                    3,
                    (int x) => Container(
                          margin: EdgeInsets.only(right: PADDING_DEFAULT_DIV_2),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, blurRadius: 10)
                              ],
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black26, BlendMode.darken),
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      submission.imageUrl))),
                        ))),
          ),
        ),
        SwitcherWidget()
      ],
    );
  }
}

class SwitcherWidget extends StatelessWidget {
  const SwitcherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: PADDING_VERTICAL,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              3,
              (index) => Container(
                    height: 3,
                    width: 10,
                    margin:
                        EdgeInsets.symmetric(horizontal: PADDING_DEFAULT_DIV_2),
                    color: Colors.black,
                  )),
        ),
        const SizedBox(
          height: PADDING_VERTICAL,
        ),
      ],
    );
  }
}

class MySliverDelegate extends SliverPersistentHeaderDelegate {
  MySliverDelegate({
    required double maxExtend,
    required double minExtend,
    required this.builder,
  })  : _maxExtend = maxExtend,
        _minExtend = minExtend;

  final double _maxExtend;
  final double _minExtend;
  final Widget Function(double percent) builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    developer.log((shrinkOffset).toString());
    return builder(shrinkOffset / _maxExtend);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _maxExtend;

  @override
  // TODO: implement minExtent
  double get minExtent => _minExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
