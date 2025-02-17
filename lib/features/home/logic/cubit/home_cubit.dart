import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/features/home/data/models/add_favorite.dart';
import 'package:market/features/home/data/models/get_product_response.dart';
import 'package:market/features/home/data/repos/home_repo.dart';
import 'package:market/features/home/logic/cubit/home_state.dart';
import 'package:market/market.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Map<String, bool> favoriteProduct = {};

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getProductRepo) : super(const HomeState.initial());
  final HomeRepo _getProductRepo;

  // get product method
  List<GetProductResponse> productList = [];

  void getProducts() async {
    emit(const HomeState.loadingGetProduct());
    final response = await _getProductRepo.getProducts();
    response.when(
      success: (productData) {
        productList = productData;

        emit(HomeState.successGetProduct(productData));
      },
      failure: (message) {
        emit(HomeState.errorGetProduct(errorMessage: message));
      },
    );
  }

  // get Category
  void getCategory(String categoryName) async {
    emit(const HomeState.loadingGetProduct());
    final response = await _getProductRepo.getCategory(categoryName);
    response.when(
      success: (productData) {
        emit(HomeState.successGetProduct(productData));
      },
      failure: (message) {
        emit(HomeState.errorGetProduct(errorMessage: message));
      },
    );
  }

  // add favorite

  void addFavorite(String productId) async {
    emit(const HomeState.loadingAddFavorite());
    final response = await _getProductRepo.addFavorite(
      AddFavorite(
        for_product_id: productId,
        for_user_id: client.auth.currentUser!.id,
        isFavorite: true,
      ),
    );
    response.when(
      success: (productData) {
        favoriteProduct.addAll({productId: true});
        emit(const HomeState.successAddFavorite());
      },
      failure: (message) {
        emit(HomeState.errorAddFavorite(errorMessage: message));
      },
    );
  }

// delete favorite
  void deleteFavorite(String productId) async {
    emit(const HomeState.loadingDeleteFavorite());
    final response = await _getProductRepo.deleteFavorite(
      client.auth.currentUser!.id,
      productId,
    );
    response.when(
      success: (productData) {
        favoriteProduct.removeWhere(
          (key, value) => key == productId,
        );
        emit(const HomeState.successDeleteFavorite());
      },
      failure: (message) {
        emit(HomeState.errorDeleteFavorite(errorMessage: message));
      },
    );
  }

  bool checkFavorite(String productId) {
    return favoriteProduct.containsKey(productId);
  }
}
