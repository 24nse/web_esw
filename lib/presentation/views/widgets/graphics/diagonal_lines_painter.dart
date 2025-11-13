// رسام الخطوط القطرية
import 'package:flutter/material.dart';

class DiagonalLinesPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth =  1;

    for (double i = -size.height; i <size.width + size.height; i += 20) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DiagonalLinesPainter1 extends CustomPainter {
  final double spacing;      // المسافة بين كل خطين
  final double thickness;    // سمك الخط
  final double lineLength;   // طول الخط (كم يغطي من الارتفاع)
  final Color color;         // لون الخط
  final bool reverse;        // عكس الاتجاه
  final double startOffset;  // بداية الرسم (كم من أعلى الكونتينر)
  final double endOffset;    // نهاية الرسم (كم من أسفل الكونتينر)

  DiagonalLinesPainter1({
    this.spacing = 20,
    this.thickness = 1,
    this.lineLength = 1.0, // 1.0 = يغطي الارتفاع الكامل
    this.color = Colors.white,
    this.reverse = false,
    this.startOffset = 0,
    this.endOffset = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.05)
      ..strokeWidth = thickness;

    // نحدّد الارتفاع المسموح للرسم
    final double startY = size.height * startOffset;
    final double endY = size.height * endOffset;
    final double effectiveHeight = endY - startY;

    for (double i = -effectiveHeight; i < size.width + effectiveHeight; i += spacing) {
      if (reverse) {
        // من الأعلى اليمين إلى الأسفل اليسار
        canvas.drawLine(
          Offset(i + effectiveHeight, startY),
          Offset(i, startY + effectiveHeight * lineLength),
          paint,
        );
      } else {
        // من الأعلى اليسار إلى الأسفل اليمين
        canvas.drawLine(
          Offset(i, startY),
          Offset(i + effectiveHeight * lineLength, startY + effectiveHeight * lineLength),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
