// رسام النجوم
import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  final Color color;

  StarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final w = size.width;
    final h = size.height;

    path.moveTo(w / 2, 0);
    path.lineTo(w * 0.6, h * 0.4);
    path.lineTo(w, h / 2);
    path.lineTo(w * 0.6, h * 0.6);
    path.lineTo(w / 2, h);
    path.lineTo(w * 0.4, h * 0.6);
    path.lineTo(0, h / 2);
    path.lineTo(w * 0.4, h * 0.4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
