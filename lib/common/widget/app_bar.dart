import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';

class PageBar extends PreferredSize {
  BuildContext context;
  String? title;
  Color? backgroundColor;
  bool hideBack;
  Widget? leftMenu;
  Widget? middleMenu;
  Widget? rightMenu;

  PageBar({
    Key? key,
    required this.context,
    this.title,
    this.backgroundColor,
    this.hideBack = false,
    this.leftMenu,
    this.middleMenu,
    this.rightMenu,
  }) : super(
          key: key,
          preferredSize: Size(MediaQuery.of(context).size.width, 88.w),
          child: Container(
            height: MediaQuery.of(context).padding.top + 88.w,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 24.w,
                right: 24.w),
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.bg,
            ),
            child: Row(
              children: [
                hideBack
                    ? SizedBox(width: 48.w, height: 48.w)
                    : GestureDetector(
                        onTap: () => Get.back(),
                        child: leftMenu ??
                            SizedBox(
                              width: 48.w,
                              height: 48.w,
                              child: Icon(
                                Icons.arrow_back_rounded,
                                size: 48.w,
                                color: AppColors.app_3C3C3C,
                              ),
                            ),
                      ),
                const Spacer(),
                middleMenu ??
                    Text(
                      title ?? '',
                      style: TextStyle(
                        color: AppColors.app_3C3C3C,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                const Spacer(),
                rightMenu ?? SizedBox(width: 48.w, height: 48.w),
              ],
            ),
          ),
        );
}
