import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_bloc.dart';
import 'package:tuterritorio/features/submission/data/datasources/submission_local_data_source.dart';
import 'package:tuterritorio/features/submission/data/models/submission_data.dart';
import 'package:tuterritorio/features/submission/data/repositories/submission_repository_impl.dart';
import 'package:tuterritorio/features/submission/domain/repositories/submission_repository.dart';
import 'package:http/http.dart' as http;
import 'core/plataform/network_info.dart';
import 'features/submission/data/datasources/submission_remote_data_source.dart';
import 'features/submission/domain/usecases/get_submission.dart';
import 'features/submission/presentation/bloc/submission_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // Features --GetSubmission
  sl.registerFactory(() => SubmissionBloc(getSubmission: sl()));
  sl.registerFactory(() => ThemeBloc());

  //use case
  sl.registerLazySingleton(() => GetSubmission(submissionRepository: sl()));

  //Repositories

  sl.registerLazySingleton<SubmissionRepository>(() => SubmissionRepositoryImpl(
      submissionLocalDataSource: sl(),
      submissionRemoteDataSource: sl(),
      networkInfo: sl()));
  //data source
  sl.registerLazySingleton<SubmissionRemoteDataSource>(
      () => SubmissionRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<SubmissionLocalDataSource>(
      () => SubmissionLocalDataSourceImpl());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  //core
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
