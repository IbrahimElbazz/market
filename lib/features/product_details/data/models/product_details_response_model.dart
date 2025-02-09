import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_details_response_model.g.dart';

@JsonSerializable()
class ProductDetailsRateResponseModel {
  String? id;
  String? created_at;
  int? rate;
  String? for_user_id;
  String? for_product_id;
  ProductDetailsRateResponseModel(
      {this.id,
      this.created_at,
      this.rate,
      this.for_user_id,
      this.for_product_id});

  factory ProductDetailsRateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsRateResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductDetailsRateResponseModelToJson(this);
}
