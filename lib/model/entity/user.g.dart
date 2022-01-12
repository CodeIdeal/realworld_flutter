// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      bio: json['bio'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      token: json['token'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'bio': instance.bio,
      'email': instance.email,
      'image': instance.image,
      'token': instance.token,
      'username': instance.username,
    };
