import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuterritorio/core/theme/const.dart';

class MessageDisplay extends StatelessWidget {
  final String message;
  const MessageDisplay({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: const TextStyle(fontSize: LARGE_SIZE_TEXT),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSubmissionCard,
      child: Padding(
        padding: EdgeInsets.only(
            top: PADDING_DEFAULT_DIV_2, bottom: PADDING_DEFAULT_DIV_2),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: PADDING_DEFAULT),
              child: Shimmer.fromColors(
                enabled: true,
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Container(
                    height: heightSubmissionCard,
                    width: widthContainer,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
