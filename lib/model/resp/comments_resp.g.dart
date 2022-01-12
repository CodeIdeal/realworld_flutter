// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsResp _$CommentsRespFromJson(Map<String, dynamic> json) => CommentsResp(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentsRespToJson(CommentsResp instance) =>
    <String, dynamic>{
      'comments': instance.comments,
    };
