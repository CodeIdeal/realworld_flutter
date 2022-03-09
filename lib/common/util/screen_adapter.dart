import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static var hasInit = false;

  static init(BuildContext context) {
    if (hasInit) return;
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      context: context,
      designSize: const Size(750, 1334),
      orientation: Orientation.portrait,
    );
    hasInit = true;
  }
}
