import 'package:json_annotation/json_annotation.dart';

part 'add_user.g.dart';

@JsonSerializable()
class AddUser {
  NewUser user;

  AddUser({required this.user});

  factory AddUser.fromJson(Map<String, dynamic> json) =>
      _$AddUserFromJson(json);

  Map<String, dynamic> toJson() => _$AddUserToJson(this);
}

@JsonSerializable()
class NewUser {
  String email;
  String password;
  String username;

  NewUser({
    required this.email,
    required this.password,
    required this.username,
  });

  factory NewUser.fromJson(Map<String, dynamic> json) =>
      _$NewUserFromJson(json);

  Map<String, dynamic> toJson() => _$NewUserToJson(this);
}
