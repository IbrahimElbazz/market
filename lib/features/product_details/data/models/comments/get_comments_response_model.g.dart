// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comments_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentsResponseModel _$GetCommentsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCommentsResponseModel(
      id: json['id'] as String?,
      created_at: json['created_at'] as String?,
      comment: json['comment'] as String?,
      for_user_id: json['for_user_id'] as String?,
      for_product_id: json['for_product_id'] as String?,
      user_name: json['user_name'] as String?,
      replay: json['replay'] as String?,
    );

Map<String, dynamic> _$GetCommentsResponseModelToJson(
        GetCommentsResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'comment': instance.comment,
      'for_user_id': instance.for_user_id,
      'for_product_id': instance.for_product_id,
      'user_name': instance.user_name,
      'replay': instance.replay,
    };
