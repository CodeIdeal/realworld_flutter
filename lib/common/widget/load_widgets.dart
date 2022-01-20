import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';

class LoadingView extends StatefulWidget {
  final String? text;

  LoadingView({this.text});

  @override
  _LoadingView createState() => _LoadingView();
}

class _LoadingView extends State<LoadingView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween(begin: pi, end: -pi).animate(controller)
      ..addListener(() {
        if (mounted) setState(() {});
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: animation.value,
            child: Icon(
              Icons.sync_rounded,
              color: AppColors.main,
              size: AppSize.w_56,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: AppSize.w_12),
            child: Text(
              widget.text ?? 'Loading...',
              style: TextStyle(fontSize: AppSize.s_24),
            ),
          ),
        ],
      ),
    );
  }
}

class RefreshLoadingView extends StatefulWidget {
  @override
  _RefreshLoadingView createState() => _RefreshLoadingView();
}

class _RefreshLoadingView extends State<RefreshLoadingView>
    with TickerProviderStateMixin {
  late AnimationController controllerLeft;
  late AnimationController controllerRight;
  late Animation animationLeft;
  late Animation animationRight;

  @override
  initState() {
    super.initState();
    controllerLeft =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationLeft = Tween(begin: 0.2, end: 1.0).animate(controllerLeft)
      ..addListener(() {
        if (mounted) setState(() {});
      });
    controllerLeft.repeat();
    controllerRight =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationRight = Tween(begin: 1.0, end: 0.2).animate(controllerRight)
      ..addListener(() {
        if (mounted) setState(() {});
      });
    controllerRight.repeat();
  }

  @override
  void dispose() {
    controllerLeft.dispose();
    controllerRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: animationLeft.value,
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: AppSize.w_16,
              height: AppSize.w_16,
              margin: EdgeInsets.only(
                right: AppSize.w_8,
              ),
              decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppSize.r_20))),
            ),
          ),
          AnimatedOpacity(
            opacity: animationRight.value,
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: AppSize.w_16,
              height: AppSize.w_16,
              decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppSize.r_20))),
            ),
          ),
        ],
      ),
    );
  }
}

class LoadFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.w_750,
      padding: EdgeInsets.symmetric(vertical: AppSize.w_14),
      margin: EdgeInsets.only(bottom: AppSize.w_200),
      child: Column(
        children: [
          Text(
            'conduit',
            style: TextStyle(
              color: AppColors.main,
              fontSize: AppSize.s_28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'A place to share your knowledge.',
            style: TextStyle(
                color: AppColors.primaryColor.shade300,
                fontSize: AppSize.s_16,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

class LoadError extends StatelessWidget {
  final String text;
  final Function callback;

  LoadError({required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.w_750,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: AppSize.w_70),
            child: Icon(
              Icons.error_rounded,
              size: AppSize.w_48,
              color: AppColors.main,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: AppSize.w_40),
            child: Text(
              text,
              style: TextStyle(),
            ),
          ),
          GestureDetector(
            onTap: () {
              callback();
            },
            child: Container(
              margin: EdgeInsets.only(bottom: AppSize.w_80),
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.w_80, vertical: AppSize.w_20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.w, color: AppColors.main),
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppSize.r_40))),
              child: const Text(
                'Retry',
                style: TextStyle(color: AppColors.main),
              ),
            ),
          ),
          LoadFooter()
        ],
      ),
    );
  }
}

class LoadEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.w_750,
      color: AppColors.bg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: AppSize.w_70),
            child: Icon(
              Icons.error_rounded,
              size: AppSize.w_48,
              color: AppColors.main,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: AppSize.w_40),
            child: const Text(
              'No Data!',
              style: TextStyle(),
            ),
          ),
          LoadFooter()
        ],
      ),
    );
  }
}
