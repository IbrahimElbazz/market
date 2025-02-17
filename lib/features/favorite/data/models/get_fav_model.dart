import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/features/home/data/models/get_product_response.dart';
part 'get_fav_model.g.dart';

@JsonSerializable()
class getFavoriteModel {
  bool isFavorite;
  String for_user_id;
  String for_product_id;
  GetProductResponse productes;

  getFavoriteModel({
    required this.productes,
    required this.isFavorite,
    required this.for_user_id,
    required this.for_product_id,
  });
  factory getFavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$getFavoriteModelFromJson(json);
}
