// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductResponse _$GetProductResponseFromJson(Map<String, dynamic> json) =>
    GetProductResponse(
      productId: json['product_id'] as String?,
      createdAt: json['created_at'] as String?,
      productName: json['product_name'] as String?,
      salary: json['salary'] as String?,
      description: json['discription'] as String?,
      category: json['category'] as String?,
      sale: json['sale'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$GetProductResponseToJson(GetProductResponse instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'created_at': instance.createdAt,
      'product_name': instance.productName,
      'salary': instance.salary,
      'discription': instance.description,
      'category': instance.category,
      'sale': instance.sale,
      'image_url': instance.imageUrl,
    };
