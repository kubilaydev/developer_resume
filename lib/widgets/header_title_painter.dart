import 'package:flutter/material.dart';

///
class HeaderTitlePainter extends CustomPainter {
  ///
  HeaderTitlePainter({required this.size});

  ///
  final Size size;

  @override
  void paint(Canvas canvas, Size size) {
    var x = size.width;
    var y = size.height;

    var path = Path()

      ///
      ..moveTo(0, 0)
      ..lineTo(x / 2, y / 3)
      ..lineTo(x, y)
      ..close();

    var paint = Paint()
      ..color = Colors.black.withOpacity(0.4)
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
