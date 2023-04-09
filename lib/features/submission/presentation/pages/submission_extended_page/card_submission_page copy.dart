import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:tuterritorio/core/theme/const.dart';
import 'package:tuterritorio/core/theme/strings_app.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/card_submission_widget/utils.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/card_submission_widget/tags.dart';
import 'dart:developer' as developer;

class CardSubmissionDetailsPage extends StatefulWidget {
  const CardSubmissionDetailsPage({Key? key, required this.submission})
      : super(key: key);
  final Submission submission;

  @override
  State<CardSubmissionDetailsPage> createState() =>
      _CardSubmissionDetailsPageState();
}

class _CardSubmissionDetailsPageState extends State<CardSubmissionDetailsPage> {
  get safeAreaSizeHeight => MediaQuery.of(context).padding.top;
  get maxExtendHeader =>
      MediaQuery.of(context).size.height - safeAreaSizeHeight;
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController(initialScrollOffset: 600);
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  bool showCommentWidget = true;

  _scrollListener() {
    if (scrollController.hasClients && scrollController.offset < 200) {
      setState(() {
        showCommentWidget = false;
      });
    } else {
      setState(() {
        showCommentWidget = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverHeaderDelegate(
                      minExtend: minExtendHeader,
                      maxExtend: maxExtendHeader,
                      builder: (double percent) {
                        print((percent * 10 / 1));
                        return TopHeaderWidget(
                          submission: widget.submission,
                          percent: (percent * 10 / 4).clamp(0, 1),
                          percentView: (percent * 10 / 1).clamp(0, 1),
                        );
                      }),
                ),
                SliverToBoxAdapter(
                  child: BottomContent(
                    submission: widget.submission,
                  ),
                ),
              ]),
          Visibility(
            visible: showCommentWidget,
            child: Positioned.fill(
                top: null,
                child: Container(
                  height: 130,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: PADDING_HORIZONTAL),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.white.withOpacity(0),
                        Colors.white70,
                        Colors.white.withOpacity(0.7)
                      ])),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.circular(BORDER_RADIUS_BIG)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: PADDING_HORIZONTAL),
                          child: Row(
                            children: [
                              Text(
                                "120 Comentarios",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(
                                width: PADDING_VERTICAL,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    ));
  }
}

class BottomContent extends StatelessWidget {
  const BottomContent({Key? key, required this.submission}) : super(key: key);
  final Submission submission;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PADDING_HORIZONTAL),
      child: Column(
        children: [
          Text(
            submission.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            submission.description,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}

/* SafeArea(
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverHeaderDelegate(
                minExtend: minExtendHeader,
                maxExtend: maxExtendHeader,
                builder: (double percent) {
                  print((percent * 10 / 2));
                  return TopHeaderWidget(
                    imageURL: widget.submission.imageUrl,
                    percent: percent.clamp(0, 1),
                    percentView: (percent * 10 / 2).clamp(0, 1),
                  );
                }),
          ),
          SliverToBoxAdapter(
            child: Placeholder(),
          ),
          SliverToBoxAdapter(
            child: Placeholder(),
          ),
        ]),
      ), */
class MySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverHeaderDelegate({
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
    return builder(shrinkOffset / (_maxExtend - _minExtend));
  }

  @override
  double get maxExtent => _maxExtend;

  @override
  double get minExtent => _minExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class TopHeaderWidget extends StatefulWidget {
  TopHeaderWidget(
      {Key? key,
      required this.submission,
      required this.percent,
      required this.percentView})
      : super(key: key);
  final Submission submission;
  final double percent;
  final double percentView;

  @override
  State<TopHeaderWidget> createState() => _TopHeaderWidgetState();
}

class _TopHeaderWidgetState extends State<TopHeaderWidget> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.9);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Transform.scale(
                scale: lerpDouble(1, 1.3, widget.percent),
                transformHitTests: false,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: lerpDouble(
                              0, 80, (widget.percent * 10 / 2).clamp(0, 1)) ??
                          PADDING_VERTICAL),
                  child: PageView.builder(
                    itemCount: 3,
                    physics: const BouncingScrollPhysics(),
                    controller: controller,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        child: Container(
                          margin: EdgeInsets.only(
                              right: PADDING_DEFAULT, top: PADDING_DEFAULT),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, blurRadius: 10)
                              ],
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      widget.submission.imageUrl[0]))),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            AnimatedCrossFade(
                firstChild: SwitcherWidget(),
                secondChild: Container(),
                crossFadeState: widget.percent == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 1000)),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
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
                    submission: widget.submission,
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

class SwitcherWidget extends StatelessWidget {
  const SwitcherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          width: avatarWidthMedium,
          height: avatarHeightMedium,
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

class _LikeWidget extends StatefulWidget {
  const _LikeWidget(this.likes);
  final int likes;

  @override
  State<_LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<_LikeWidget> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Icon(
        Icons.favorite_rounded,
        color: isLiked ? Colors.redAccent : Colors.grey,
        size: BORDER_RADIUS_BIG,
      ),
    );
  }
}
