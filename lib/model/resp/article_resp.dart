import 'package:json_annotation/json_annotation.dart';

import '../entity/article.dart';

part 'article_resp.g.dart';

@JsonSerializable()
class ArticleResp {
  Article article;

  ArticleResp({required this.article});

  factory ArticleResp.fromJson(Map<String, dynamic> json) =>
      _$ArticleRespFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleRespToJson(this);
}
