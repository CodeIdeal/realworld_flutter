// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      body: json['body'] as String,
      createdAt: json['createdAt'] as String,
      id: json['id'] as int,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'author': instance.author,
      'body': instance.body,
      'createdAt': instance.createdAt,
      'id': instance.id,
      'updatedAt': instance.updatedAt,
    };
