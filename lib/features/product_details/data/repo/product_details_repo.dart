import 'package:market/core/network/api_result.dart';
import 'package:market/core/network/api_service.dart';
import 'package:market/features/product_details/data/models/comments/add_comment_model.dart';
import 'package:market/features/product_details/data/models/comments/get_comments_response_model.dart';
import 'package:market/features/product_details/data/models/rates/add_rate_request_model.dart';
import 'package:market/features/product_details/data/models/rates/product_details_rate_response_model.dart';
import 'package:market/features/product_details/data/models/rates/update_rate_request_model.dart';

class ProductDetailsRepo {
  ProductDetailsRepo(ApiService apiService) : _apiService = apiService;
  final ApiService _apiService;

// get rate
  Future<ApiResult<List<ProductDetailsRateResponseModel>>>
      getProductDetailsRate(String productId) async {
    try {
      final response = await _apiService.getProductDetailsRate(productId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  // add rate
  Future<ApiResult> addRate(AddRateRequestModel addRateRequestModel) async {
    try {
      final response = await _apiService.addRate(addRateRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  // update rate
  Future<ApiResult> updateRate({
    required String userId,
    required String productId,
    required UpdateRateRequestModel rate,
  }) async {
    try {
      final response = await _apiService.updateRate(
        userId,
        productId,
        rate,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  // get comments

  Future<ApiResult<List<GetCommentsResponseModel>>> getComments(
      {required String productId}) async {
    try {
      final response = await _apiService.getComments(productId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  // add comment

  Future<ApiResult> addComment(AddCommentModel addCommentModel) async {
    try {
      final response = await _apiService.addComment(addCommentModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
