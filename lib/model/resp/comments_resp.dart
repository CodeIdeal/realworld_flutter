import 'package:json_annotation/json_annotation.dart';

import '../entity/comment.dart';

part 'comments_resp.g.dart';

@JsonSerializable()
class CommentsResp {
  List<Comment> comments;

  CommentsResp({required this.comments});

  factory CommentsResp.fromJson(Map<String, dynamic> json) =>
      _$CommentsRespFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsRespToJson(this);
}
