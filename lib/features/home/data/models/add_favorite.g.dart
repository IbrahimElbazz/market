// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavorite _$AddFavoriteFromJson(Map<String, dynamic> json) => AddFavorite(
      isFavorite: json['isFavorite'] as bool?,
      for_user_id: json['for_user_id'] as String?,
      for_product_id: json['for_product_id'] as String?,
    );

Map<String, dynamic> _$AddFavoriteToJson(AddFavorite instance) =>
    <String, dynamic>{
      'isFavorite': instance.isFavorite,
      'for_user_id': instance.for_user_id,
      'for_product_id': instance.for_product_id,
    };
