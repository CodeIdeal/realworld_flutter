import 'package:json_annotation/json_annotation.dart';

import '../entity/profile.dart';

part 'profile_resp.g.dart';

@JsonSerializable()
class ProfileResp {
  Profile profile;

  ProfileResp({required this.profile});

  factory ProfileResp.fromJson(Map<String, dynamic> json) =>
      _$ProfileRespFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRespToJson(this);
}
