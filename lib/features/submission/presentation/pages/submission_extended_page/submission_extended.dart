import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';

import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/pages/submission_extended_page/card_submission_page.dart';

class SubmissionExtended extends StatelessWidget {
  const SubmissionExtended({Key? key, required this.submission})
      : super(key: key);
  final Submission submission;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPersistentHeader(
                  delegate: BuilderPersistentDelegate(
                      builder: (double percent) {
                        return AnimatedDetailHeader(
                            submission: submission,
                            bottomPercent: ((percent) / 0.3).clamp(0, 1),
                            topPercent: ((1 - percent) / 0.7).clamp(0, 1));
                      },
                      maxExtended: MediaQuery.of(context).size.height,
                      minExtended: 240)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PADDING_HORIZONTAL),
                  child: Column(children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black26,
                        ),
                        Text(
                          "Localization",
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    Text(
                      submission.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      submission.description,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.visible,
                    )
                  ]),
                ),
              ),
            ],
          ),
          /* 
          Positioned.fill(
              top: null,
              child: Container(
                height: 130,
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
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                              BorderRadius.circular(BORDER_RADIUS_NORMAL)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: PADDING_HORIZONTAL),
                        child: Row(
                          children: [
                            TextWhite(
                              text: "120 Comentarios",
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
              ))*/
        ],
      ),
    );
  }
}

class AnimatedDetailHeader extends StatelessWidget {
  const AnimatedDetailHeader({
    Key? key,
    required this.submission,
    required this.topPercent,
    required this.bottomPercent,
  }) : super(key: key);

  final Submission submission;
  final double topPercent;
  final double bottomPercent;
  final double avatarWidth = 40;
  final double avatarHeight = 40;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          child: Padding(
            padding: EdgeInsets.only(
              top: (20 + topPadding) * (1 - bottomPercent),
              bottom: 160 * (1 - bottomPercent),
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
              height: 120,
              padding: const EdgeInsets.symmetric(
                horizontal: PADDING_HORIZONTAL,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    label: Text(
                      submission.upVote.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.comment,
                        color: SECONDARY_COLOR,
                      ),
                      Icon(
                        Icons.share,
                        color: SECONDARY_COLOR,
                      ),
                    ],
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      ),
                      label: Text(
                        "Aceptada",
                        style: TextStyle(
                            fontSize: MEDIUM_SIZE_TEXT, color: Colors.black),
                      )),
                ],
              ),
            )),
        /* 
        Positioned.fill(
            top: null,
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(
                horizontal: PADDING_HORIZONTAL,
                vertical: PADDING_VERTICAL,
              ),
              color: Colors.white,
              child: Column(children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/avatar.png',
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
                        TextPrimary(
                          text: submission.userName,
                          fontSize: SMALL_SIZE_TEXT,
                        ),
                        TextPrimary(
                          text: submission.date,
                          fontSize: SMALL_SIZE_TEXT,
                        )
                      ],
                    ),
                  ],
                )
              ]),
            )),*/
        Positioned(
            left: 0,
            top: topPadding,
            child: const BackButton(
              color: Colors.white,
            )),
      ],
    );
  }
}

class PlaceImageWidget extends StatefulWidget {
  const PlaceImageWidget({
    Key? key,
    required this.submission,
  }) : super(key: key);

  final Submission submission;

  @override
  State<PlaceImageWidget> createState() => _PlaceImageWidgetState();
}

class _PlaceImageWidgetState extends State<PlaceImageWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: PageController(viewportFraction: 0.9),
              itemCount: 3,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                final isSelected = currentIndex == index;
                return AnimatedContainer(
                  margin: EdgeInsets.only(
                      right: 10,
                      top: isSelected ? 5 : 20,
                      bottom: isSelected ? 5 : 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            widget.submission.imageUrl)),
                  ),
                  duration: Duration(milliseconds: 500),
                );
              }),
        ),
        const SizedBox(
          height: PADDING_VERTICAL,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              bool isSelected = currentIndex == index;
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                color: isSelected ? Colors.black38 : Colors.black12,
                height: 3,
                width: isSelected ? 15 : 10,
                margin: const EdgeInsets.symmetric(horizontal: 3),
              );
            })),
      ],
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  BuilderPersistentDelegate({
    required double maxExtended,
    required double minExtended,
    required this.builder,
  })  : _maxExtended = maxExtended,
        _minExtended = minExtended;

  late final double _maxExtended;
  late final double _minExtended;
  late final Widget Function(double percent) builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / _maxExtended);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _maxExtended;

  @override
  // TODO: implement minExtent
  double get minExtent => _minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
