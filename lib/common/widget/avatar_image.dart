import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';
import 'package:realworld_flutter/common/util/dart_ext.dart';

class AvatarImage extends StatelessWidget {
  final String? url;
  final double? size;
  final Color bg;
  final bool hasBorder;
  final Color borderColor;
  final double? borderWidth;
  final double? padding;

  const AvatarImage({
    Key? key,
    required this.url,
    this.bg = Colors.transparent,
    this.hasBorder = true,
    this.borderColor = AppColors.main,
    this.size,
    this.borderWidth,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasBorder ? warpBorder(avatar()) : avatar();
  }

  Widget warpBorder(Widget widget) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: (size ?? AppSize.w_48),
      height: (size ?? AppSize.w_48),
      padding: padding?.let((it) => EdgeInsets.all(it)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(size ?? AppSize.w_48)),
        border: Border.all(
          color: borderColor,
          width: borderWidth ?? AppSize.w_1,
        ),
      ),
      child: widget,
    );
  }

  Widget avatar() {
    final avatarSize = (size ?? AppSize.w_48) -
        ((padding ?? 0) + (borderWidth ?? AppSize.w_1)) * 2;
    return ClipOval(
      child: url.isNullOrEmpty
          ? Icon(
              Icons.person_rounded,
              color: AppColors.main,
              size: avatarSize,
            )
          : Image.network(
              url!,
              width: avatarSize,
              height: avatarSize,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, progress) => (progress == null)
                  ? child
                  : Icon(
                      Icons.person_rounded,
                      size: avatarSize,
                      color: AppColors.main,
                    ),
              errorBuilder: (context, error, stacktrace) => Icon(
                Icons.person_rounded,
                size: avatarSize,
                color: AppColors.main,
              ),
            ),
    );
  }
}
