import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_rate_request_model.g.dart';

@JsonSerializable()
class UpdateRateRequestModel {
  int? rate;

  UpdateRateRequestModel({
    this.rate,
  });

  Map<String, dynamic> toJson() => _$UpdateRateRequestModelToJson(this);
}
