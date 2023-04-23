import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tuterritorio/core/theme/const.dart';
import 'package:tuterritorio/core/theme/strings_app.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/main.dart';

import '../../widgets/card_submission_widget/like_widget.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({Key? key, required this.percent, required this.images})
      : super(key: key);
  final double percent;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PlaceImgWidget(images: images, percent: percent),
        Positioned(
          bottom: 0,
          child: Container(
            height: heightUserInfoContainer,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(BORDER_RADIUS_BIG),
                topRight: Radius.circular(BORDER_RADIUS_BIG),
              ),
              color: isDark(context) ? SURFACE_COLOR_DARK : BACKGROUND_COLOR,
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: PADDING_HORIZONTAL, vertical: PADDING_VERTICAL),
                child: UserInfoContainer()),
          ),
        )
      ],
    );
  }
}

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _UserContent(
          publishDate: "2022-12-30",
          userName: "lorem ipsum",
        ),
        LikeWidget(likes: 10),
      ],
    );
  }
}

class PlaceImgWidget extends StatefulWidget {
  const PlaceImgWidget({
    Key? key,
    required this.images,
    required this.percent,
  }) : super(key: key);

  final List<String> images;
  final double percent;

  @override
  State<PlaceImgWidget> createState() => _PlaceImgWidgetState();
}

class _PlaceImgWidgetState extends State<PlaceImgWidget> {
  get paddingBottom => lerp(
      heightUserInfoContainer, heightUserInfoContainer - heightSwitchContainer);
  get transformScale => lerp(1, 1.3);

  get lerp => (a, b) {
        return lerpDouble(a, b, widget.percent);
      };

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    print(widget.percent);
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Column(
        children: [
          Expanded(
            child: Transform.scale(
              scale: transformScale,
              child: PageView.builder(
                  itemCount: widget.images.length,
                  controller: PageController(viewportFraction: 0.9),
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    bool isSelected = currentIndex == index;
                    return ImageWidget(
                        isSelected: isSelected, url: widget.images[index]);
                  }),
            ),
          ),
          AnimatedOpacity(
            opacity: widget.percent < 0.15 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: heightSwitchContainer,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.images.length, (index) {
                    bool isSelected = currentIndex == index;
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      color: isDark(context)
                          ? isSelected
                              ? Colors.white
                              : Colors.white.withOpacity(0.5)
                          : isSelected
                              ? Colors.black38
                              : Colors.black12,
                      height: 3,
                      width: isSelected ? 15 : 10,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                    );
                  })),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.isSelected,
    required this.url,
  }) : super(key: key);

  final bool isSelected;
  final String url;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      margin: EdgeInsets.only(
          top: isSelected ? PADDING_VERTICAL / 2 : PADDING_VERTICAL * 2,
          bottom: isSelected ? PADDING_VERTICAL / 2 : PADDING_VERTICAL * 2,
          right: PADDING_DEFAULT),
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
          borderRadius: BorderRadius.circular(BORDER_RADIUS_BIG),
          image: DecorationImage(
              fit: BoxFit.cover, image: CachedNetworkImageProvider(url))),
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
          height: avatarWidth,
        ),
        const SizedBox(
          width: PADDING_DEFAULT,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
