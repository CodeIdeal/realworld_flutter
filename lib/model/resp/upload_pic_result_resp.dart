import 'package:json_annotation/json_annotation.dart';
import 'package:realworld_flutter/model/resp/upload_pic_resp.dart';

part 'upload_pic_result_resp.g.dart';

@JsonSerializable()
class UploadPicResult {
  bool success;
  String code;
  String message;
  UploadPic? data;
  String? images;
  String RequestId;

  UploadPicResult({
    required this.success,
    required this.code,
    required this.message,
    this.data,
    this.images,
    required this.RequestId,
  });

  factory UploadPicResult.fromJson(Map<String, dynamic> json) =>
      _$UploadPicResultFromJson(json);

  Map<String, dynamic> toJson() => _$UploadPicResultToJson(this);
}
