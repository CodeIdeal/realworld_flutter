// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateArticle _$CreateArticleFromJson(Map<String, dynamic> json) =>
    CreateArticle(
      article: NewArticle.fromJson(json['article'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateArticleToJson(CreateArticle instance) =>
    <String, dynamic>{
      'article': instance.article,
    };

NewArticle _$NewArticleFromJson(Map<String, dynamic> json) => NewArticle(
      body: json['body'] as String,
      description: json['description'] as String?,
      tagList:
          (json['tagList'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$NewArticleToJson(NewArticle instance) =>
    <String, dynamic>{
      'body': instance.body,
      'description': instance.description,
      'tagList': instance.tagList,
      'title': instance.title,
    };
