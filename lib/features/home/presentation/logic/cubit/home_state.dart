import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/features/home/presentation/data/models/get_product_response.dart';

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
}
