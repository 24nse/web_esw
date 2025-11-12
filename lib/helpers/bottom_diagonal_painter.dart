
// رسام الخطوط السفلية
import 'package:flutter/material.dart';

class BottomDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF6B2C).withOpacity(0.15)
      ..strokeWidth = 8;

    for (double i = 0; i < size.width + size.height; i += 16) {
      canvas.drawLine(
        Offset(size.width - i, size.height),
        Offset(size.width - i + size.height, 0),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}