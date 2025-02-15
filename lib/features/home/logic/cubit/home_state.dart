import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/features/home/data/models/get_product_response.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  //get product state
  const factory HomeState.loadingGetProduct() = loadingGetProduct;
  const factory HomeState.successGetProduct(
      List<GetProductResponse> getProductResponse) = SuccessGetProduct;
  const factory HomeState.errorGetProduct({required String errorMessage}) =
      ErrorGetProduct;

  // get category
  const factory HomeState.loadingGetCategory() = loadingGetCategory;
  const factory HomeState.successGetCategory(
      List<GetProductResponse> getProductResponse) = SuccessGetCategory;
  const factory HomeState.errorGetCategory({required String errorMessage}) =
      ErrorGetCategory;
}
