import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_rate_request_model.g.dart';

@JsonSerializable()
class AddRateRequestModel {
  int? rate;
  @JsonKey(name: 'for_user_id')
  String? forUserId;
  @JsonKey(name: 'for_product_id')
  String? forProductId;

  AddRateRequestModel({this.rate, this.forUserId, this.forProductId});

  Map<String, dynamic> toJson() => _$AddRateRequestModelToJson(this);
}
