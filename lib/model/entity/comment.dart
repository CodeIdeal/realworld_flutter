import 'package:json_annotation/json_annotation.dart';

import 'author.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  Author author;
  String body;
  String createdAt;
  int id;
  String updatedAt;

  Comment({
    required this.author,
    required this.body,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}