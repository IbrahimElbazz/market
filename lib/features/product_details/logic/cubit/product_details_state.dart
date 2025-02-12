import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/features/product_details/data/models/comments/get_comments_response_model.dart';
import 'package:market/features/product_details/data/models/rates/product_details_rate_response_model.dart';
part 'product_details_state.freezed.dart';

@freezed
class ProductDetailsState<T> with _$ProductDetailsState<T> {
  const factory ProductDetailsState.initial() = _Initial;

  // get rate
  const factory ProductDetailsState.loadingGetProductDetailsRate() =
      LoadingGetProductDetailsRate;
  const factory ProductDetailsState.successGetProductDetailsRate(
          List<ProductDetailsRateResponseModel> productDetails) =
      SuccessGetProductDetailsRate;
  const factory ProductDetailsState.errorGetProductDetailsRate(
      {required String errorMessage}) = ErrorGetProductDetailsRate;

  // add rate
  const factory ProductDetailsState.loadingAddRate() = LoadingAddRate;
  const factory ProductDetailsState.successAddRate() = SuccessAddRate;
  const factory ProductDetailsState.errorAddRate(
      {required String errorMessage}) = ErrorAddRate;

  // update rate
  const factory ProductDetailsState.loadingUpdateRate() = LoadingUpdateRate;
  const factory ProductDetailsState.successUpdateRate() = SuccessUpdateRate;
  const factory ProductDetailsState.errorUpdateRate(
      {required String errorMessage}) = ErrorUpdateRate;

  // get comments
  const factory ProductDetailsState.loadingGetComments() = LoadingGetComments;
  const factory ProductDetailsState.successGetComments(
          List<GetCommentsResponseModel> getCommentsResponse) =
      SuccessGetComments<T>;
  const factory ProductDetailsState.errorGetComments(
      {required String errorMessage}) = ErrorGetComments;
}
