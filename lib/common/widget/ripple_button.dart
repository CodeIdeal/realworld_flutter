import 'package:flutter/material.dart';

@immutable
class RippleButton extends StatelessWidget {
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;
  final Widget? child;
  final double? width;
  final double? height;

  const RippleButton(
      {Key? key,
      this.width,
      this.height,
      this.decoration,
      this.padding,
      this.onTap,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        width: width,
        height: height,
        decoration: decoration,
        child: InkWell(
          borderRadius: decoration?.borderRadius?.resolve(TextDirection.ltr),
          onTap: onTap,
          child: padding == null
              ? Center(child: child)
              : Padding(
                  padding: padding!,
                  child: Center(child: child),
                ),
        ),
      ),
    );
  }
}
