// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfile _$UpdateProfileFromJson(Map<String, dynamic> json) =>
    UpdateProfile(
      user: NewProfile.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProfileToJson(UpdateProfile instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

NewProfile _$NewProfileFromJson(Map<String, dynamic> json) => NewProfile(
      bio: json['bio'] as String?,
      email: json['email'] as String,
      image: json['image'] as String?,
      password: json['password'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$NewProfileToJson(NewProfile instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'email': instance.email,
      'image': instance.image,
      'password': instance.password,
      'username': instance.username,
    };
