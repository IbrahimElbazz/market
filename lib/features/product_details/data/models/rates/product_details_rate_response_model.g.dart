// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_rate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsRateResponseModel _$ProductDetailsRateResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsRateResponseModel(
      id: json['id'] as String?,
      created_at: json['created_at'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      for_user_id: json['for_user_id'] as String?,
      for_product_id: json['for_product_id'] as String?,
    );

Map<String, dynamic> _$ProductDetailsRateResponseModelToJson(
        ProductDetailsRateResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'rate': instance.rate,
      'for_user_id': instance.for_user_id,
      'for_product_id': instance.for_product_id,
    };
