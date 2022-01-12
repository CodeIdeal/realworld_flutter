import 'package:json_annotation/json_annotation.dart';

import '../entity/user.dart';

part 'user_resp.g.dart';

@JsonSerializable()
class UserResp {
  User user;

  UserResp({required this.user});

  factory UserResp.fromJson(Map<String, dynamic> json) =>
      _$UserRespFromJson(json);

  Map<String, dynamic> toJson() => _$UserRespToJson(this);
}
