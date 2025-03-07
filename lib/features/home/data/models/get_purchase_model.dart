import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/features/home/data/models/get_product_response.dart';
part 'get_purchase_model.g.dart';

@JsonSerializable()
class GetPurchaseModel {
  String? id;
  String? createdAt;
  bool? isBought;
  String? forUserId;
  String? forProductId;
  GetProductResponse? productes;

  GetPurchaseModel(
      {this.id,
      this.createdAt,
      this.isBought,
      this.forUserId,
      this.forProductId,
      this.productes});

  factory GetPurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$GetPurchaseModelFromJson(json);
}
