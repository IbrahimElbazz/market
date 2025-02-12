// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentModel _$AddCommentModelFromJson(Map<String, dynamic> json) =>
    AddCommentModel(
      comment: json['comment'] as String?,
      for_user_id: json['for_user_id'] as String?,
      for_product_id: json['for_product_id'] as String?,
      user_name: json['user_name'] as String?,
    );

Map<String, dynamic> _$AddCommentModelToJson(AddCommentModel instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'for_user_id': instance.for_user_id,
      'for_product_id': instance.for_product_id,
      'user_name': instance.user_name,
    };
