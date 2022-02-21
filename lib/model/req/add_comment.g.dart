// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddComment _$AddCommentFromJson(Map<String, dynamic> json) => AddComment(
      comment: NewComment.fromJson(json['comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCommentToJson(AddComment instance) =>
    <String, dynamic>{
      'comment': instance.comment,
    };

NewComment _$NewCommentFromJson(Map<String, dynamic> json) => NewComment(
      body: json['body'] as String,
    );

Map<String, dynamic> _$NewCommentToJson(NewComment instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
