import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kma_app/BusinessLayer/DataAccess/Http/Service/home_service.dart';
import 'package:kma_app/BusinessLayer/DataAccess/Http/Service/login_service.dart';
import 'package:kma_app/View/Screen/LoginScreen/login_viewmodel.dart';

import '../api_client.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()));
  getIt.registerLazySingleton<LoginService>(() => LoginService(getIt<ApiClient>()));
  getIt.registerLazySingleton<HomeService>(() => HomeService(getIt<ApiClient>()));
}