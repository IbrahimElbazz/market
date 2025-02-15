import 'package:dio/dio.dart';
import 'package:market/core/network/api_constant.dart';
import 'package:market/features/favorite/data/models/get_fav_model.dart';
import 'package:market/features/home/data/models/add_favorite.dart';
import 'package:market/features/home/data/models/get_product_response.dart';
import 'package:market/features/product_details/data/models/comments/add_comment_model.dart';
import 'package:market/features/product_details/data/models/comments/get_comments_response_model.dart';
import 'package:market/features/product_details/data/models/rates/add_rate_request_model.dart';
import 'package:market/features/product_details/data/models/rates/product_details_rate_response_model.dart';
import 'package:market/features/product_details/data/models/rates/update_rate_request_model.dart';
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

  // add rate
  @POST(ApiConstant.addRate)
  Future addRate(@Body() AddRateRequestModel addRateRequestModel);

  // update rate
  @PATCH(ApiConstant.updateRate)
  Future updateRate(
      @Path('userId') String userId,
      @Path('productId') String productId,
      @Body() UpdateRateRequestModel updateRateRequestModel);

  // get comments
  @GET(ApiConstant.getComment)
  Future<List<GetCommentsResponseModel>> getComments(
    @Path() String id,
  );

  // add comment

  @POST(ApiConstant.addComment)
  Future addComment(
    @Body() AddCommentModel addCommentModel,
  );

  // get category

  @GET(ApiConstant.getCategory)
  Future<List<GetProductResponse>> getCategory(
    @Path('category') String categoryName,
  );

  // add favorite

  @POST(ApiConstant.addFavorite)
  Future addFavorite(
    @Body() AddFavorite addFavoriteModel,
  );

  @DELETE(ApiConstant.deleteFavorite)
  Future deleteFavorite(
    @Path('userId') String userId,
    @Path('productId') String productId,
  );

  @GET(ApiConstant.getFavorite)
  Future<List<getFavoriteModel>> getFavorite();
}
