import 'package:dio/dio.dart';
import 'package:market/core/network/api_constant.dart';
import 'package:market/features/home/data/models/get_product_response.dart';
import 'package:market/features/product_details/data/models/product_details_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // get products
  @GET(ApiConstant.getProduct)
  Future<List<GetProductResponse>> getProduct();

  // get products details rate
  @GET(ApiConstant.productDetails)
  Future<List<ProductDetailsRateResponseModel>> getProductDetailsRate(
    @Path('id') String id,
  );
}
