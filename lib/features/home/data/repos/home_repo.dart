import 'package:market/core/network/api_result.dart';
import 'package:market/core/network/api_service.dart';
import 'package:market/features/home/data/models/add_favorite.dart';
import 'package:market/features/home/data/models/get_product_response.dart';
import 'package:market/features/home/data/models/get_purchase_model.dart';

class HomeRepo {
  HomeRepo(ApiService apiService) : _apiService = apiService;
  final ApiService _apiService;

  Future<ApiResult<List<GetProductResponse>>> getProducts() async {
    try {
      final response = await _apiService.getProduct();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  // get Category
  Future<ApiResult<List<GetProductResponse>>> getCategory(
      String categoryName) async {
    try {
      final response = await _apiService.getCategory(categoryName);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  // add favorite
  Future<ApiResult> addFavorite(AddFavorite addFavoriteModel) async {
    try {
      final response = await _apiService.addFavorite(addFavoriteModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  // delete favorite
  Future<ApiResult> deleteFavorite(String userId, String productId) async {
    try {
      final response = await _apiService.deleteFavorite(
        userId,
        productId,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  // get Purchase

  Future<ApiResult<List<GetPurchaseModel>>> getPurchase(String userId) async {
    try {
      final response = await _apiService.getPurchase(userId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
