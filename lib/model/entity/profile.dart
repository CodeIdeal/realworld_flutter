import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  String? bio;
  bool following;
  String image;
  String username;

  Profile({
    this.bio,
    this.following = false,
    required this.image,
    required this.username,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}