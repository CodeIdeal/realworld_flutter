// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_pic_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPic _$UploadPicFromJson(Map<String, dynamic> json) => UploadPic(
      fileId: json['file_id'] as int,
      width: json['width'] as int,
      height: json['height'] as int,
      filename: json['filename'] as String,
      storename: json['storename'] as String,
      size: json['size'] as int,
      path: json['path'] as String,
      hash: json['hash'] as String,
      url: json['url'] as String,
      delete: json['delete'] as String,
      page: json['page'] as String,
    );

Map<String, dynamic> _$UploadPicToJson(UploadPic instance) => <String, dynamic>{
      'fileId': instance.fileId,
      'width': instance.width,
      'height': instance.height,
      'filename': instance.filename,
      'storename': instance.storename,
      'size': instance.size,
      'path': instance.path,
      'hash': instance.hash,
      'url': instance.url,
      'delete': instance.delete,
      'page': instance.page,
    };
