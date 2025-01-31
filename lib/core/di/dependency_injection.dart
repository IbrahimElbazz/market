import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:market/core/network/api_service.dart';
import 'package:market/core/network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}
