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
      data: json['data'] == null
          ? null
          : UploadPic.fromJson(json['data'] as Map<String, dynamic>),
      images: json['images'] as String?,
      requestId: json['RequestId'] as String,
    );

Map<String, dynamic> _$UploadPicResultToJson(UploadPicResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'images': instance.images,
      'RequestId': instance.requestId,
    };
