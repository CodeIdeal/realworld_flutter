import 'package:json_annotation/json_annotation.dart';

part 'update_profile.g.dart';

@JsonSerializable()
class UpdateProfile {
  NewProfile user;

  UpdateProfile({required this.user});

  factory UpdateProfile.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileToJson(this);
}

@JsonSerializable()
class NewProfile {
  String bio;
  String email;
  String image;
  String password;
  String username;

  NewProfile({
    required this.bio,
    required this.email,
    required this.image,
    required this.password,
    required this.username,
  });

  factory NewProfile.fromJson(Map<String, dynamic> json) =>
      _$NewProfileFromJson(json);

  Map<String, dynamic> toJson() => _$NewProfileToJson(this);
}
