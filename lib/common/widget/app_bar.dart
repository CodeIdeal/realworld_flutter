import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';

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
          preferredSize: Size(MediaQuery.of(context).size.width, AppSize.w_88),
          child: Container(
            height: MediaQuery.of(context).padding.top + AppSize.w_88,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: AppSize.w_24,
                right: AppSize.w_24),
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.bg,
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: hideBack
                        ? const SizedBox.shrink()
                        : leftMenu ??
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: SizedBox(
                                width: AppSize.w_48,
                                height: AppSize.w_48,
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  size: AppSize.w_48,
                                  color: AppColors.main,
                                ),
                              ),
                            ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Center(
                    child: middleMenu ??
                        Text(
                          title ?? '',
                          style: TextStyle(
                            color: AppColors.main,
                            fontSize: AppSize.s_36,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: AppSize.w_48,
                      height: AppSize.w_48,
                      child: rightMenu,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
