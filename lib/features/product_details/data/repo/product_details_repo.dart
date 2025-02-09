import 'package:market/core/network/api_result.dart';
import 'package:market/core/network/api_service.dart';
import 'package:market/features/product_details/data/models/product_details_response_model.dart';

class ProductDetailsRepo {
  ProductDetailsRepo(ApiService apiService) : _apiService = apiService;
  final ApiService _apiService;

  Future<ApiResult<List<ProductDetailsRateResponseModel>>>
      getProductDetailsRate(String productId) async {
    try {
      final response = await _apiService.getProductDetailsRate(productId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
