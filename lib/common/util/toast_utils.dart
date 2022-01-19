import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';

class ToastUtils {
  static showError(dynamic e) {
    if (e is DioError) {
      show(e.message);
    }  else {
      show(e.toString());
    }
    // TODO: add other exception handle logic
  }

  static show(String text) {
    if (Platform.isAndroid || Platform.isIOS) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: text,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 14.sp,
      );
    } else {
      // it may not show toast. see: https://github.com/flutter/flutter/issues/30294
      FToast().init(Get.context!).showToast(
            child: Container(
              constraints: BoxConstraints.loose(Size(700.w, 64.w)),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.w),
                color: AppColors.black_50,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 28.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
    }
  }
}
