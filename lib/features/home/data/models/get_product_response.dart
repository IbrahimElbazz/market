import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_product_response.g.dart';

@JsonSerializable()
class GetProductResponse {
  @JsonKey(name: 'product_id')
  String? productId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'product_name')
  String? productName;
  String? salary;
  @JsonKey(name: 'discription')
  String? description;
  String? category;
  String? sale;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  List<RateProduct>? rateProduct;
  List<CommentsTable>? commentsTable;
  List<FavoriteProduct>? favoriteProduct;

  GetProductResponse(
      {this.productId,
      this.createdAt,
      this.productName,
      this.salary,
      this.description,
      this.category,
      this.sale,
      this.imageUrl});

  factory GetProductResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductResponseFromJson(json);
}

@JsonSerializable()
class RateProduct {
  String? id;
  int? rate;
  String? created_at;
  String? for_user_id;
  String? for_product_id;

  RateProduct(
      {this.id,
      this.rate,
      this.created_at,
      this.for_user_id,
      this.for_product_id});
  factory RateProduct.fromJson(Map<String, dynamic> json) =>
      _$RateProductFromJson(json);
}

@JsonSerializable()
class CommentsTable {
  String? id;
  String? comment;
  String? created_at;
  String? for_user_id;
  String? for_product_id;

  CommentsTable(
      {this.id,
      this.comment,
      this.created_at,
      this.for_user_id,
      this.for_product_id});
  factory CommentsTable.fromJson(Map<String, dynamic> json) =>
      _$CommentsTableFromJson(json);
}

@JsonSerializable()
class FavoriteProduct {
  String? id;
  String? created_at;
  bool? isFavorite;
  String? for_user_id;
  String? for_product_id;

  FavoriteProduct(
      {this.id,
      this.created_at,
      this.isFavorite,
      this.for_user_id,
      this.for_product_id});
  factory FavoriteProduct.fromJson(Map<String, dynamic> json) =>
      _$FavoriteProductFromJson(json);
}
