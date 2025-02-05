import 'package:market/core/network/api_result.dart';
import 'package:market/core/network/api_service.dart';
import 'package:market/features/home/presentation/data/models/get_product_response.dart';

class GetProductRepo {
  GetProductRepo(ApiService apiService) : _apiService = apiService;
  final ApiService _apiService;

  Future<ApiResult<List<GetProductResponse>>> getProducts() async {
    try {
      final response = await _apiService.getProduct();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
