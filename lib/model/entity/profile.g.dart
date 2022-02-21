// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      bio: json['bio'] as String?,
      following: (json['following'] as bool?) ?? false,
      image: json['image'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'bio': instance.bio,
      'following': instance.following,
      'image': instance.image,
      'username': instance.username,
    };
