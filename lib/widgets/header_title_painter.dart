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
    print(" size with : ${this.size.width}");
    var x = this.size.width;
    var y = this.size.height;

    var tinyPath = Path()
      ..moveTo(0, 0)
      ..lineTo(x / 1.6, 0)
      ..lineTo(40, y)
      ..lineTo(0, y)
      ..close();

    var expandedPath = Path()
      ..moveTo(0, 0)
      ..lineTo(x / 1.6, 0)
      ..lineTo(80, y)
      ..lineTo(0, y)
      ..close();

    var paint = Paint()
      ..color = Colors.black.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    canvas.drawPath(this.size.width > 410 ? tinyPath : expandedPath, paint);
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
