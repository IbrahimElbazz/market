// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_purchase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPurchaseModel _$GetPurchaseModelFromJson(Map<String, dynamic> json) =>
    GetPurchaseModel(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isBought: json['isBought'] as bool?,
      forUserId: json['forUserId'] as String?,
      forProductId: json['forProductId'] as String?,
      productes: json['productes'] == null
          ? null
          : GetProductResponse.fromJson(
              json['productes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPurchaseModelToJson(GetPurchaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isBought': instance.isBought,
      'forUserId': instance.forUserId,
      'forProductId': instance.forProductId,
      'productes': instance.productes,
    };
