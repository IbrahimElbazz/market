import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_favorite.g.dart';

@JsonSerializable()
class AddFavorite {
  bool? isFavorite;
  String? for_user_id;
  String? for_product_id;

  AddFavorite({
    this.isFavorite,
    this.for_user_id,
    this.for_product_id,
  });
  Map<String, dynamic> toJson() => _$AddFavoriteToJson(this);
}
