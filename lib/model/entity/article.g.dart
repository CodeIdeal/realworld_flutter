// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      author: Profile.fromJson(json['author'] as Map<String, dynamic>),
      body: json['body'] as String,
      createdAt: json['createdAt'] as String,
      description: json['description'] as String,
      favorited: json['favorited'] as bool,
      favoritesCount: json['favoritesCount'] as int,
      slug: json['slug'] as String,
      tagList:
          (json['tagList'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'author': instance.author,
      'body': instance.body,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'favorited': instance.favorited,
      'favoritesCount': instance.favoritesCount,
      'slug': instance.slug,
      'tagList': instance.tagList,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
    };
