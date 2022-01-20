import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';

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
        fontSize: AppSize.s_14,
      );
    } else {
      // it may not show toast. see: https://github.com/flutter/flutter/issues/30294
      FToast().init(Get.context!).showToast(
            child: Container(
              constraints:
                  BoxConstraints.loose(Size(AppSize.w_700, AppSize.w_64)),
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.w_24, vertical: AppSize.w_12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.w_26),
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
                        fontSize: AppSize.s_28,
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
