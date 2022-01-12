import 'package:json_annotation/json_annotation.dart';

import '../entity/comment.dart';
import '../entity/article.dart';

part 'comment_resp.g.dart';

@JsonSerializable()
class CommentResp {
  Comment comment;

  CommentResp({required this.comment});

  factory CommentResp.fromJson(Map<String, dynamic> json) =>
      _$CommentRespFromJson(json);

  Map<String, dynamic> toJson() => _$CommentRespToJson(this);
}
