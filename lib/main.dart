import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/features/submission/domain/entities/submission.dart';
import 'package:tuterritorio/features/submission/presentation/bloc/submission_bloc.dart';
import 'package:tuterritorio/features/submission/presentation/pages/submission_page/submission_page.dart';
import 'package:tuterritorio/inject_container.dart';

import 'features/submission/presentation/pages/home_page/home_page.dart';
import 'features/submission/presentation/pages/submission_extended/submission_extended.dart';
import 'features/submission/presentation/widgets/card_submission.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => sl<SubmissionBloc>(),
      )
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        late Widget page;
        if (settings.name == routeHome) {
          page = const HomePage();
        } else if (settings.name == routeSubmissionDetails) {
          final arguments = settings.arguments as Submission;
          page = SubmissionExtended(
            submission: arguments,
          );
        } else if (settings.name == routeSubmission) {
          page = SubmissionPage();
        }
        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Urbanist'),
    );
  }
}
