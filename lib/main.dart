import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_state.dart';
import 'package:tuterritorio/core/theme/const.dart';
import 'package:tuterritorio/core/theme/theme.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/bloc/submission_bloc.dart';
import 'package:tuterritorio/features/submission/presentation/pages/submission_extended_page/card_submission_extend_page.dart';
import 'package:tuterritorio/features/submission/presentation/pages/submission_extended_page/card_submission_page%20copy.dart';
import 'package:tuterritorio/features/submission/presentation/pages/submission_page/submission_page.dart';
import 'package:tuterritorio/inject_container.dart';

import 'core/presentation/bloc/theme_switch_bloc.dart';
import 'core/presentation/bloc/theme_switch_event.dart';
import 'features/submission/presentation/pages/home_page/home_page.dart';
import 'features/submission/presentation/pages/filter_page/filter_page.dart';
import 'features/submission/presentation/widgets/card_submission_widget/card_submission.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => sl<SubmissionBloc>(),
      ),
      BlocProvider(create: (_) => sl<ThemeBloc>())
    ], child: const MyApp());
  }
}

bool isDark(BuildContext context) {
  final bloc = context.read<ThemeBloc>();
  return (bloc.state as ActiveThemeState).theme == ThemeAppEnum.dark;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
      if (state is ActiveThemeState) {
        return MaterialApp(
            title: 'Flutter Demo',
            initialRoute: '/',
            onGenerateRoute: (settings) {
              late Widget page;
              if (settings.name == routeHome) {
                page = const HomePage();
              } else if (settings.name == routeSubmissionDetails) {
                final arguments = settings.arguments as Submission;
                page = CardSubmissionExtendedPage(
                  submission: arguments,
                );
              } else if (settings.name == routeSubmission) {
                page = const SubmissionPage();
              } else if (settings.name == routeSubmissionFilter) {
                page = const FilterPage();
              }
              return MaterialPageRoute<dynamic>(
                builder: (context) {
                  return page;
                },
                settings: settings,
              );
            },
            debugShowCheckedModeBanner: false,
            theme: enumToTheme[state.theme]);
      } else {
        return const MaterialApp(title: 'Flutter Demo', initialRoute: '/');
      }
    });
  }
}
