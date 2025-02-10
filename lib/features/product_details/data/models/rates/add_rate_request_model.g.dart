// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_rate_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRateRequestModel _$AddRateRequestModelFromJson(Map<String, dynamic> json) =>
    AddRateRequestModel(
      rate: (json['rate'] as num?)?.toInt(),
      forUserId: json['for_user_id'] as String?,
      forProductId: json['for_product_id'] as String?,
    );

Map<String, dynamic> _$AddRateRequestModelToJson(
        AddRateRequestModel instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'for_user_id': instance.forUserId,
      'for_product_id': instance.forProductId,
    };
