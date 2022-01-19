import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';

class LoadingDialog {
  static BuildContext? dialogContext;

  static hide({bool isAwait = false}) async {
    if (dialogContext == null && !isAwait) {
      await Future.delayed(const Duration(milliseconds: 200));
      hide(isAwait: true);
      return;
    }

    bool isActive = false;
    try {
      RenderObject? object = dialogContext?.findRenderObject();
      isActive = object != null;
    } catch (e) {
      log('loading context is inActive $e');
      isActive = false;
    }
    if (dialogContext != null && isActive) {
      Navigator.of(dialogContext!).pop();
      dialogContext = null;
    }
  }

  static show() {
    Get.dialog(
        DialogWrapper(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: AppSize.w_160,
              height: AppSize.w_160,
              padding: EdgeInsets.all(AppSize.w_32),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppSize.r_20))),
              child: const CircularProgressIndicator(
                color: AppColors.main,
              ),
            )
          ],
        )),
        useSafeArea: false,
        barrierDismissible: false,
        barrierColor: Colors.transparent);
  }
}

class DialogWrapper extends StatelessWidget {
  final Widget child;

  const DialogWrapper({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoadingDialog.dialogContext = context;
    return Container(
      width: Get.width,
      height: Get.height,
      color: AppColors.transparent,
      child: child,
    );
  }
}
