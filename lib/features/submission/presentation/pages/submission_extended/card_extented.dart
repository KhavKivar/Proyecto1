import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/widgets/tags.dart';

class CardSubmissionDetailsWidget extends StatelessWidget {
  const CardSubmissionDetailsWidget({Key? key, required this.submission})
      : super(key: key);
  final Submission submission;
  @override
  Widget build(BuildContext context) {
    print(submission.tags);
    return Card(
        color: Colors.white,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: submission.imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Container(
              child: Column(children: [
                Text(submission.title),
                Tags(submission.tags),
                Text(submission.description),
              ]),
            )
          ],
        ));
  }
}
