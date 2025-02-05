import 'package:dio/dio.dart';
import 'package:market/core/network/api_constant.dart';
import 'package:market/features/home/presentation/data/models/get_product_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // get products
  @GET(ApiConstant.getProduct)
  Future<List<GetProductResponse>> getProduct();
}
