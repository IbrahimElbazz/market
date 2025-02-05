import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:market/core/network/api_service.dart';
import 'package:market/core/network/dio_factory.dart';
import 'package:market/features/home/presentation/data/repos/get_product_repo.dart';
import 'package:market/features/home/presentation/logic/cubit/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // home cubit
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
  // get product repo
  getIt.registerFactory<GetProductRepo>(() => GetProductRepo(getIt()));
}
