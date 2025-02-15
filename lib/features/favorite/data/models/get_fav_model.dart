import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/features/home/data/models/get_product_response.dart';
part 'get_fav_model.g.dart';

@JsonSerializable()
class getFavoriteModel {
  GetProductResponse productes;

  getFavoriteModel({required this.productes});
  factory getFavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$getFavoriteModelFromJson(json);
}
