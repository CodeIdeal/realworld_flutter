import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String bio;
  String email;
  String image;
  String token;
  String username;

  User({
    required this.bio,
    required this.email,
    required this.image,
    required this.token,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
