import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_comment_model.g.dart';

@JsonSerializable()
class AddCommentModel {
  String? comment;
  String? for_user_id;
  String? for_product_id;
  String? user_name;

  AddCommentModel({
    this.comment,
    this.for_user_id,
    this.for_product_id,
    this.user_name,
  });

  Map<String, dynamic> toJson() => _$AddCommentModelToJson(this);
}
