import 'package:flutter/material.dart';

///
class HeaderTitlePainter extends CustomPainter {
  ///
  HeaderTitlePainter(
      {required this.size, required this.height, required this.width});

  ///
  final Size size;

  ///
  final double height;

  ///
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    var x = size.width;
    var y = size.height;

    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, 1.7 * y)
      ..lineTo(x / 1.5, y - 15)
      ..close();

    var paint = Paint()
      ..color = Colors.white.withOpacity(0.4)
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
