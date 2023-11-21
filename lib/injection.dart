import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restapi/cubit/my_cubit.dart';
import 'package:restapi/my_repo.dart';
import 'package:restapi/web_services.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<AppCubit>(() => AppCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = 200 * 1000
    ..options.receiveTimeout = 200 * 1000;

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}
