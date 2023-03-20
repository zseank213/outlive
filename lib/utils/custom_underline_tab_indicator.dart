import 'package:flutter/material.dart';

class CustomUnderlineTabIndicator extends Decoration {
  final BoxPainter _painter;

  CustomUnderlineTabIndicator({required Color color, required double radius}) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final double _xPos = offset.dx + cfg.size!.width / 2;
    final double _yPos = offset.dy + cfg.size!.height / 2;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(_xPos - 20, _yPos + 24, _xPos + 20, _yPos + 20),
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
      _paint,
    );
  }
}
