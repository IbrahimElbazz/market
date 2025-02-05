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
