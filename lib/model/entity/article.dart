import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'profile.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  Profile author;
  String body;
  String createdAt;
  String description;
  bool favorited;
  int favoritesCount;
  String slug;
  List<String> tagList;
  String title;
  String updatedAt;

  Article({
    required this.author,
    required this.body,
    required this.createdAt,
    required this.description,
    required this.favorited,
    required this.favoritesCount,
    required this.slug,
    required this.tagList,
    required this.title,
    required this.updatedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}