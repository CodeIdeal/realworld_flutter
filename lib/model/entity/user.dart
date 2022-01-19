import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String email;
  String token;
  String username;
  String? bio;
  String? image;

  User({
    required this.email,
    required this.token,
    required this.username,
    this.bio,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
