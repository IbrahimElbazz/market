import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/features/home/data/models/get_product_response.dart';
import 'package:market/features/home/data/models/get_purchase_model.dart';

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

  // add favorite
  const factory HomeState.loadingAddFavorite() = loadingAddFavorite;
  const factory HomeState.successAddFavorite() = SuccessAddFavorite;
  const factory HomeState.errorAddFavorite({required String errorMessage}) =
      ErrorAddFavorite;

  // delete favorite
  const factory HomeState.loadingDeleteFavorite() = loadingDeleteFavorite;
  const factory HomeState.successDeleteFavorite() = SuccessDeleteFavorite;
  const factory HomeState.errorDeleteFavorite({required String errorMessage}) =
      ErrorDeleteFavorite;

  // get Purchase
  const factory HomeState.loadingGetPurchase() = loadingGetPurchase;
  const factory HomeState.successGetPurchase(
      List<GetPurchaseModel> getPurchaseModel) = SuccessGetPurchase;
  const factory HomeState.errorGetPurchase({required String errorMessage}) =
      ErrorGetPurchase;
}
