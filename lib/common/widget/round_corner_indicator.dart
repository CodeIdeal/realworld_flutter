import 'package:flutter/widgets.dart';

class RoundCornerIndicator extends Decoration {
  final BoxPainter _painter;

  RoundCornerIndicator(
      {required Color color,
      required BorderRadius radius,
      double height = 2.0,
      double padding = 0.0})
      : _painter = _RoundPainter(color, radius, height, padding);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _RoundPainter extends BoxPainter {
  final Paint _paint;
  final double height;
  final double padding;
  final BorderRadius radius;

  _RoundPainter(Color color, this.radius, this.height, this.padding)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final rect = Rect.fromLTRB(
        offset.dx + padding,
        offset.dy + (cfg.size?.height ?? 0.0) - height,
        offset.dx + (cfg.size?.width ?? 0.0) - padding,
        offset.dy + (cfg.size?.height ?? 0.0));
    final rrect = radius.resolve(TextDirection.ltr).toRRect(rect);
    canvas.drawRRect(rrect, _paint);
  }
}
