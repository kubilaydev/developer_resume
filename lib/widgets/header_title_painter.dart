import 'package:flutter/material.dart';

///
class HeaderTitlePainter extends CustomPainter {
  ///
  HeaderTitlePainter({
    required this.size,
  });

  ///
  final Size size;

  @override
  void paint(Canvas canvas, Size size) {
    var x = this.size.width;
    var y = this.size.height;

    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(x / 1.6, 0)
      ..lineTo(0, y / 1)
      ..close();

    var paint = Paint()
      ..color = Colors.black.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HeaderTitlePainter oldDelegate) {
    return size != oldDelegate.size;
  }

  @override
  bool shouldRebuildSemantics(HeaderTitlePainter oldDelegate) {
    return false;
  }
}
