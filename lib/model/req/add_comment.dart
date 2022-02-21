import 'package:json_annotation/json_annotation.dart';

part 'add_comment.g.dart';

@JsonSerializable()
class AddComment {
  NewComment comment;

  AddComment({required this.comment});

  factory AddComment.fromJson(Map<String, dynamic> json) =>
      _$AddCommentFromJson(json);

  Map<String, dynamic> toJson() => _$AddCommentToJson(this);
}

@JsonSerializable()
class NewComment {
  String body;

  NewComment({
    required this.body,
  });

  factory NewComment.fromJson(Map<String, dynamic> json) =>
      _$NewCommentFromJson(json);

  Map<String, dynamic> toJson() => _$NewCommentToJson(this);
}
