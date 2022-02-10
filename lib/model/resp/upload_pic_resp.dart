import 'package:json_annotation/json_annotation.dart';

part 'upload_pic_resp.g.dart';

@JsonSerializable()
class UploadPic {
  int fileId;
  int width;
  int height;
  String filename;
  String storename;
  int size;
  String path;
  String hash;
  String url;
  String delete;
  String page;

  UploadPic({
    required this.fileId,
    required this.width,
    required this.height,
    required this.filename,
    required this.storename,
    required this.size,
    required this.path,
    required this.hash,
    required this.url,
    required this.delete,
    required this.page,
  });

  factory UploadPic.fromJson(Map<String, dynamic> json) =>
      _$UploadPicFromJson(json);

  Map<String, dynamic> toJson() => _$UploadPicToJson(this);
}
