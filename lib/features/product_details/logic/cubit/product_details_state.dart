import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/features/product_details/data/models/product_details_response_model.dart';
part 'product_details_state.freezed.dart';

@freezed
class ProductDetailsState<T> with _$ProductDetailsState<T> {
  const factory ProductDetailsState.initial() = _Initial;
  const factory ProductDetailsState.loadingGetProductDetailsRate() =
      LoadingGetProductDetailsRate;
  const factory ProductDetailsState.successGetProductDetailsRate(
          List<ProductDetailsRateResponseModel> productDetails) =
      SuccessGetProductDetailsRate;
  const factory ProductDetailsState.errorGetProductDetailsRate(
      {required String errorMessage}) = ErrorGetProductDetailsRate;
}
