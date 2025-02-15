import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:market/core/network/api_service.dart';
import 'package:market/core/network/dio_factory.dart';
import 'package:market/features/favorite/data/repo/fav_repo.dart';
import 'package:market/features/favorite/logic/cubit/fav_cubit.dart';
import 'package:market/features/home/data/repos/home_repo.dart';
import 'package:market/features/home/logic/cubit/home_cubit.dart';
import 'package:market/features/product_details/data/repo/product_details_repo.dart';
import 'package:market/features/product_details/logic/cubit/product_details_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // home cubit
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
  // get product repo
  getIt.registerFactory<HomeRepo>(() => HomeRepo(getIt()));
  // get product details
  getIt.registerLazySingleton<ProductDetailsCubit>(
      () => ProductDetailsCubit(getIt()));
  getIt.registerFactory<ProductDetailsRepo>(() => ProductDetailsRepo(getIt()));

  //get  fav
  getIt.registerLazySingleton<FavCubit>(() => FavCubit(getIt()));
  getIt.registerFactory<FavRepo>(() => FavRepo(getIt()));
}
