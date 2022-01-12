import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';

class PageBar extends PreferredSize {
  BuildContext context;
  String? title;
  Color? backgroundColor;
  Widget? rightMenu;
  Widget? middleMenu;
  Widget? leftMenu;

  PageBar({
    Key? key,
    required this.context,
    this.title,
    this.backgroundColor,
    this.rightMenu,
    this.middleMenu,
    this.leftMenu,
  }) : super(
          key: key,
          preferredSize: Size(MediaQuery.of(context).size.width, 88.w),
          child: Container(
            height: MediaQuery.of(context).padding.top + 88.w,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.bg,
            ),
            child: Row(
              children: [
                leftMenu ??
                    SizedBox(
                      width: 48.w,
                      height: 48.w,
                      child: Icon(Icons.arrow_back_rounded, size: 48.w),
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
                rightMenu ?? const SizedBox.shrink(),
              ],
            ),
          ),
        );
}
