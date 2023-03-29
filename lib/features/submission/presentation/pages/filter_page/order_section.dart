import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/bloc/submission_bloc.dart';
import 'package:tuterritorio/features/submission/presentation/pages/filter_page/filter_page.dart';

import 'const/const.dart';

class OrderBySectionFilter extends StatefulWidget {
  const OrderBySectionFilter({Key? key}) : super(key: key);

  @override
  State<OrderBySectionFilter> createState() => _OrderByPageState();
}

class _OrderByPageState extends State<OrderBySectionFilter> {
  late String select;

  @override
  void didChangeDependencies() {
    final SubmissionState stateInitial = context.read<SubmissionBloc>().state;

    if (stateInitial is Loaded) {
      select = sortDataBuilder
          .firstWhere((element) => element.orderValue == stateInitial.orderBy)
          .nameOnUI;
    } else {
      select = defaultOrderValue;
    }
    super.didChangeDependencies();
  }

  void handleOnSelect(BuildContext context, FilterBySortData sortBuildObject) {
    final SubmissionState state = context.read<SubmissionBloc>().state;
    if (state is Loaded) {
      final List<Submission> submissions = state.submissions;
      context.read<SubmissionBloc>().add(FilterSubmissionsEvents(
          submissions: submissions,
          wordToSearch: '',
          orderBy: sortBuildObject.orderValue,
          categories: state.category));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textSortSettings,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Wrap(
            children: List.generate(sortDataBuilder.length, (index) {
          return InkWell(
            onTap: () {
              setState(() {
                select = sortDataBuilder[index].nameOnUI;
                handleOnSelect(context, sortDataBuilder[index]);
              });
            },
            child: OrderChip(
              text: sortDataBuilder[index].nameOnUI,
              iconData: sortDataBuilder[index].associatedDataOnUI,
              isPainted: select == sortDataBuilder[index].nameOnUI,
            ),
          );
        })),
      ],
    );
  }
}

/*
[ 
          for (String key in waysToOrder.keys)
            InkWell(
              onTap: () {
                setState(() {
                  select = key;
                  handleOnSelect(context);
                });
              },
              child: OrderChip(
                text: key,
                iconData: waysToOrder[key]!,
                isPainted: select == key,
              ),
            )
        ]
 */
class OrderChip extends StatelessWidget {
  const OrderChip(
      {Key? key,
      required this.text,
      required this.iconData,
      required this.isPainted})
      : super(key: key);
  final String text;
  final IconData iconData;
  final bool isPainted;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthOrderChip,
      child: Padding(
        padding: const EdgeInsets.all(PADDING_DEFAULT),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: isPainted ? SECONDARY_COLOR : Colors.white,
                  borderRadius: BorderRadius.circular(BORDER_RADIUS_BIG),
                  border: Border.all(
                    width: 1.5,
                    color: isPainted ? SECONDARY_COLOR : PRIMARY_COLOR,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(PADDING_DEFAULT_DIV_2),
                  child: Icon(
                    iconData,
                    color: isPainted ? Colors.white : PRIMARY_COLOR,
                  ),
                )),
            Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: isPainted
                    ? Theme.of(context).textTheme.displaySmall
                    : Theme.of(context).textTheme.titleSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
