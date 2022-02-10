// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_pic_result_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPicResult _$UploadPicResultFromJson(Map<String, dynamic> json) =>
    UploadPicResult(
      success: json['success'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      data: (json['data'] != null) ? UploadPic.fromJson(json['data']) : null,
      images: json['images'] as String?,
      RequestId: json['RequestId'] as String,
    );

Map<String, dynamic> _$UploadPicResultToJson(UploadPicResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
      'images': instance.images,
      'data': instance.data,
      'RequestId': instance.RequestId,
    };
