import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo_imp.dart';
import '../network/api_service.dart';



final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
}