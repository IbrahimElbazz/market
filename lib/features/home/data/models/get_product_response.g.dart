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
    )
      ..rateProduct = (json['rateProduct'] as List<dynamic>?)
          ?.map((e) => RateProduct.fromJson(e as Map<String, dynamic>))
          .toList()
      ..commentsTable = (json['commentsTable'] as List<dynamic>?)
          ?.map((e) => CommentsTable.fromJson(e as Map<String, dynamic>))
          .toList()
      ..favoriteProduct = (json['favoriteProduct'] as List<dynamic>?)
          ?.map((e) => FavoriteProduct.fromJson(e as Map<String, dynamic>))
          .toList();

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
      'rateProduct': instance.rateProduct,
      'commentsTable': instance.commentsTable,
      'favoriteProduct': instance.favoriteProduct,
    };

RateProduct _$RateProductFromJson(Map<String, dynamic> json) => RateProduct(
      id: json['id'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      created_at: json['created_at'] as String?,
      for_user_id: json['for_user_id'] as String?,
      for_product_id: json['for_product_id'] as String?,
    );

Map<String, dynamic> _$RateProductToJson(RateProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'created_at': instance.created_at,
      'for_user_id': instance.for_user_id,
      'for_product_id': instance.for_product_id,
    };

CommentsTable _$CommentsTableFromJson(Map<String, dynamic> json) =>
    CommentsTable(
      id: json['id'] as String?,
      comment: json['comment'] as String?,
      created_at: json['created_at'] as String?,
      for_user_id: json['for_user_id'] as String?,
      for_product_id: json['for_product_id'] as String?,
    );

Map<String, dynamic> _$CommentsTableToJson(CommentsTable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'created_at': instance.created_at,
      'for_user_id': instance.for_user_id,
      'for_product_id': instance.for_product_id,
    };

FavoriteProduct _$FavoriteProductFromJson(Map<String, dynamic> json) =>
    FavoriteProduct(
      id: json['id'] as String?,
      created_at: json['created_at'] as String?,
      isFavorite: json['isFavorite'] as bool,
      for_user_id: json['for_user_id'] as String?,
      for_product_id: json['for_product_id'] as String?,
    );

Map<String, dynamic> _$FavoriteProductToJson(FavoriteProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'isFavorite': instance.isFavorite,
      'for_user_id': instance.for_user_id,
      'for_product_id': instance.for_product_id,
    };
