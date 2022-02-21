// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      bio: json['bio'] as String?,
      following: json['following'] as bool,
      image: json['image'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'bio': instance.bio,
      'following': instance.following,
      'image': instance.image,
      'username': instance.username,
    };
