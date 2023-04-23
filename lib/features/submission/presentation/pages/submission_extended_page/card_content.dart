import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tuterritorio/core/theme/const.dart';

import '../../../../../main.dart';
import '../../widgets/card_submission_widget/tags.dart';

class SubmissionContentExtended extends StatefulWidget {
  const SubmissionContentExtended(
      {Key? key,
      required this.title,
      required this.description,
      required this.tags})
      : super(key: key);
  final String title;
  final String description;
  final List<String> tags;

  @override
  State<SubmissionContentExtended> createState() =>
      _SubmissionContentExtendedState();
}

typedef void OnWidgetSizeChange(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant MeasureSizeRenderObject renderObject) {
    renderObject.onChange = onChange;
  }
}

class _SubmissionContentExtendedState extends State<SubmissionContentExtended> {
  Size? myChildSize = Size.zero;

  double get spaceToAdd => (MediaQuery.of(context).size.height -
      heightSubmissionCard -
      (myChildSize?.height ?? 0));

  double get bottomSpace => spaceToAdd > 0 ? spaceToAdd : 100;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDark(context) ? SURFACE_COLOR_DARK : BACKGROUND_COLOR,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PADDING_HORIZONTAL),
          child: Column(children: [
            MeasureSize(
              onChange: (size) {
                setState(() {
                  myChildSize = size;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title.trim(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    widget.description.trim(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: bottomSpace,
            )
          ])),
    );
  }
}
