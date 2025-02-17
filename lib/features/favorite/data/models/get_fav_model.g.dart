// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_fav_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

getFavoriteModel _$getFavoriteModelFromJson(Map<String, dynamic> json) =>
    getFavoriteModel(
      productes: GetProductResponse.fromJson(
          json['productes'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool,
      for_user_id: json['for_user_id'] as String,
      for_product_id: json['for_product_id'] as String,
    );

Map<String, dynamic> _$getFavoriteModelToJson(getFavoriteModel instance) =>
    <String, dynamic>{
      'isFavorite': instance.isFavorite,
      'for_user_id': instance.for_user_id,
      'for_product_id': instance.for_product_id,
      'productes': instance.productes,
    };
