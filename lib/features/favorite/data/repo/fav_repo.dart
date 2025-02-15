import 'package:market/core/network/api_result.dart';
import 'package:market/core/network/api_service.dart';
import 'package:market/features/favorite/data/models/get_fav_model.dart';

class FavRepo {
  final ApiService _apiService;

  FavRepo(ApiService apiService) : _apiService = apiService;

  Future<ApiResult<List<getFavoriteModel>>> getFav() async {
    try {
      final response = await _apiService.getFavorite();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
