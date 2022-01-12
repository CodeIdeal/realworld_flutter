import 'package:json_annotation/json_annotation.dart';

import 'errors.dart';

part 'error.g.dart';

@JsonSerializable()
class Error {
  Errors errors;

  Error({required this.errors});

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
