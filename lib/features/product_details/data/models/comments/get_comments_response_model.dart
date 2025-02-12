import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_comments_response_model.g.dart';

@JsonSerializable()
class GetCommentsResponseModel {
  String? id;
  String? created_at;
  String? comment;
  String? for_user_id;
  String? for_product_id;
  String? user_name;
  String? replay;

  GetCommentsResponseModel(
      {this.id,
      this.created_at,
      this.comment,
      this.for_user_id,
      this.for_product_id,
      this.user_name,
      this.replay});

  factory GetCommentsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsResponseModelFromJson(json);
}
