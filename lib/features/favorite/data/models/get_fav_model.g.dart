// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_fav_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

getFavoriteModel _$getFavoriteModelFromJson(Map<String, dynamic> json) =>
    getFavoriteModel(
      productes: GetProductResponse.fromJson(
          json['productes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$getFavoriteModelToJson(getFavoriteModel instance) =>
    <String, dynamic>{
      'productes': instance.productes,
    };
