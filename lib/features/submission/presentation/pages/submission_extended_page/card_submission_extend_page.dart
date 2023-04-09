import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tuterritorio/core/theme/const.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/pages/submission_extended_page/card_content.dart';

import 'top_header_widget.dart';

class CardSubmissionExtendedPage extends StatefulWidget {
  const CardSubmissionExtendedPage({Key? key, required this.submission})
      : super(key: key);
  final Submission submission;

  @override
  State<CardSubmissionExtendedPage> createState() =>
      _CardSubmissionExtendedPageState();
}

class _CardSubmissionExtendedPageState
    extends State<CardSubmissionExtendedPage> {
  get safeAreaSizeHeight => MediaQuery.of(context).padding.top;
  get maxExtendHeader =>
      MediaQuery.of(context).size.height - safeAreaSizeHeight;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    scrollController = ScrollController(
        initialScrollOffset: maxExtendHeader - minExtendHeader);
    scrollController.addListener(_scrollListener);
    super.didChangeDependencies();
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
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverHeaderDelegate(
                      minExtend: minExtendHeader,
                      maxExtend: maxExtendHeader,
                      builder: (double percent) {
                        return TopHeader(
                          percent: percent.clamp(0, 1),
                          images: widget.submission.imageUrl,
                        );
                      }),
                ),
                SliverToBoxAdapter(
                    child: SubmissionContentExtended(
                  title: widget.submission.title,
                  description: widget.submission.description,
                  tags: widget.submission.tags,
                )),
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
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "120 Comentarios",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              width: PADDING_VERTICAL,
                            ),
                            Icon(
                              Icons.arrow_forward,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    ));
  }
}

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
    return Align(child: builder(shrinkOffset / (_maxExtend - _minExtend)));
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
