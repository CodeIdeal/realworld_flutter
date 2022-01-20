import 'package:flutter/material.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';

// 加载页面
class LoadingPage extends StatefulWidget {
  final double? width;
  final bool hideText;

  const LoadingPage({Key? key, this.width, this.hideText = false})
      : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController _controllerForLoading;

  late AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    _controllerForLoading = AnimationController(vsync: this);
    _rotateController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controllerForLoading.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: AppSize.w_10),
              child: AnimatedBuilder(
                  animation: _rotateController,
                  child: Icon(
                    Icons.sync_rounded,
                    size: AppSize.w_56,
                    color: AppColors.main,
                  ),
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotateController.value * 2.0 * 3.14,
                      child: child,
                    );
                  }),
            ),
            if (!widget.hideText)
              Text(
                '努力加载中...',
                style: TextStyle(
                    fontSize: AppSize.s_24, color: AppColors.app_999999),
              )
          ],
        ));
  }
}
