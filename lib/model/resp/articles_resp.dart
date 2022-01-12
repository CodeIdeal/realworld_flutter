import 'package:json_annotation/json_annotation.dart';

import '../entity/article.dart';

part 'articles_resp.g.dart';

@JsonSerializable()
class ArticlesResp {
  List<Article> articles;
  int articlesCount;

  ArticlesResp({required this.articles, required this.articlesCount});

  factory ArticlesResp.fromJson(Map<String, dynamic> json) =>
      _$ArticlesRespFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesRespToJson(this);
}
