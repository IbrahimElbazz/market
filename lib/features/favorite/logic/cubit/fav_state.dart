import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/features/favorite/data/models/get_fav_model.dart';
import 'package:market/features/home/data/models/get_product_response.dart';

part 'fav_state.freezed.dart';

@freezed
class FavState with _$FavState {
  const factory FavState.initial() = _Initial;
  const factory FavState.loadingGetVaf() = LoadingGetVaf;
  const factory FavState.successGetVaf(List<getFavoriteModel> getProduct) =
      SuccessGetVaf;
  const factory FavState.errorGetVaf({required String errorMessage}) =
      ErrorGetVaf;
}
