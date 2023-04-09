import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/theme/const.dart';
import 'package:tuterritorio/core/theme/strings_app.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/bloc/submission_bloc.dart';
import 'package:tuterritorio/features/submission/presentation/pages/filter_page/categories_section.dart';
import 'package:tuterritorio/features/submission/presentation/pages/filter_page/order_section.dart';
import 'package:tuterritorio/main.dart';

import 'utils/utils.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PADDING_HORIZONTAL, vertical: PADDING_VERTICAL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.maybePop(context);
                  },
                  child: Icon(
                    Icons.clear,
                    color: isDark(context) ? TEXT_COLOR_DARK : PRIMARY_COLOR,
                  ),
                ),
                Text(
                  textResetSettings,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            const SizedBox(
              height: PADDING_DEFAULT,
            ),
            Text(
              textMainTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: PADDING_VERTICAL,
            ),
            const OrderBySectionFilter(),
            const CategoriesSectionFilter()
          ],
        ),
      )),
    );
  }
}
