import 'package:json_annotation/json_annotation.dart';

part 'create_article.g.dart';

@JsonSerializable()
class CreateArticle{
  NewArticle article;

  CreateArticle({required this.article});

  factory CreateArticle.fromJson(Map<String, dynamic> json) => _$CreateArticleFromJson(json);

  Map<String, dynamic> toJson() => _$CreateArticleToJson(this);
}

@JsonSerializable()
class NewArticle{
  String body;
  String description;
  List<String> tagList;
  String title;

  NewArticle({
    required this.body,
    required this.description,
    required this.tagList,
    required this.title,
});

  factory NewArticle.fromJson(Map<String, dynamic> json) => _$NewArticleFromJson(json);

  Map<String, dynamic> toJson() => _$NewArticleToJson(this);
}