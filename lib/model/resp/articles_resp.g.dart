// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesResp _$ArticlesRespFromJson(Map<String, dynamic> json) => ArticlesResp(
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      articlesCount: json['articlesCount'] as int,
    );

Map<String, dynamic> _$ArticlesRespToJson(ArticlesResp instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'articlesCount': instance.articlesCount,
    };
