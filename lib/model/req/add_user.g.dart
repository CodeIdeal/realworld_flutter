// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUser _$AddUserFromJson(Map<String, dynamic> json) => AddUser(
      user: NewUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddUserToJson(AddUser instance) => <String, dynamic>{
      'user': instance.user,
    };

NewUser _$NewUserFromJson(Map<String, dynamic> json) => NewUser(
      email: json['email'] as String,
      password: json['password'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$NewUserToJson(NewUser instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
    };
