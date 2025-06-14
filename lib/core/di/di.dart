import 'package:chat_app/core/network/dio_helper.dart';
import 'package:get_it/get_it.dart';

import '../network/api_helper.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // تسجيل ApiHelper
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());
  getIt.registerLazySingleton<ApiHelper>(() => ApiHelper());

}
