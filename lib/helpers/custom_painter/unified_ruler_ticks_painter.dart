import 'dart:math' as math;
import 'package:flutter/material.dart';

enum UnifiedRulerTicksMode { none, horizontal, diagonal }
enum DiagonalDirection { downRight, downLeft }

class UnifiedRulerTicksPainter extends CustomPainter {
  // ✅ الإضافة الجديدة
  final bool isVertical; // عندما true، يرسم على اليسار/اليمين بدل الأعلى/الأسفل

  // ---------------- Top (أعلى) ----------------
  final bool drawTop;
  final UnifiedRulerTicksMode topMode;
  final double topStep;
  final List<double> topPatternHeights;
  final double topMargin;
  final double topStrokeWidth;
  final Color topColor;
  final double topAngleDeg;
  final DiagonalDirection topDirection;

  // --------------- Bottom (أسفل) ---------------
  final bool drawBottom;
  final UnifiedRulerTicksMode bottomMode;
  final double bottomStep;
  final List<double> bottomPatternHeights;
  final double bottomMargin;
  final double bottomStrokeWidth;
  final Color bottomColor;
  final double bottomAngleDeg;
  final DiagonalDirection bottomDirection;

  const UnifiedRulerTicksPainter({
    this.isVertical = false, // 🔸 القيمة الافتراضية — أفقي

    // Top
    this.drawTop = true,
    this.topMode = UnifiedRulerTicksMode.horizontal,
    this.topStep = 20,
    this.topPatternHeights = const [14, 6, 10, 6, 14],
    this.topMargin = 4,
    this.topStrokeWidth = 1,
    this.topColor = const Color(0xFFD1D5DB),
    this.topAngleDeg = 60,
    this.topDirection = DiagonalDirection.downRight,

    // Bottom
    this.drawBottom = true,
    this.bottomMode = UnifiedRulerTicksMode.horizontal,
    this.bottomStep = 20,
    this.bottomPatternHeights = const [14, 6, 10, 6, 14],
    this.bottomMargin = 4,
    this.bottomStrokeWidth = 1,
    this.bottomColor = const Color(0xFFD1D5DB),
    this.bottomAngleDeg = 60,
    this.bottomDirection = DiagonalDirection.downRight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (isVertical) {
      _paintVertical(canvas, size);
    } else {
      _paintHorizontal(canvas, size);
    }
  }

  // =====================================================
  // ✅ الوضع الأفقي (الافتراضي): Top / Bottom
  // =====================================================
  void _paintHorizontal(Canvas canvas, Size size) {
    // --- Top ---
    if (drawTop && topMode != UnifiedRulerTicksMode.none) {
      _paintUnifiedRulerTicks(
        canvas: canvas,
        size: size,
        isTop: true,
        mode: topMode,
        step: topStep,
        pattern: topPatternHeights,
        margin: topMargin,
        strokeWidth: topStrokeWidth,
        color: topColor,
        angleDeg: topAngleDeg,
        direction: topDirection,
      );
    }

    // --- Bottom ---
    if (drawBottom && bottomMode != UnifiedRulerTicksMode.none) {
      _paintUnifiedRulerTicks(
        canvas: canvas,
        size: size,
        isTop: false,
        mode: bottomMode,
        step: bottomStep,
        pattern: bottomPatternHeights,
        margin: bottomMargin,
        strokeWidth: bottomStrokeWidth,
        color: bottomColor,
        angleDeg: bottomAngleDeg,
        direction: bottomDirection,
      );
    }
  }

  // =====================================================
  // ✅ الوضع الرأسي (عند isVertical = true): Left / Right
  // =====================================================
  void _paintVertical(Canvas canvas, Size size) {
    // --- Left (يستخدم إعدادات Top) ---
    if (drawTop && topMode != UnifiedRulerTicksMode.none) {
      _paintSide(
        canvas: canvas,
        size: size,
        isLeft: true,
        mode: topMode,
        step: topStep,
        pattern: topPatternHeights,
        margin: topMargin,
        strokeWidth: topStrokeWidth,
        color: topColor,
        angleDeg: topAngleDeg,
        direction: topDirection,
      );
    }

    // --- Right (يستخدم إعدادات Bottom) ---
    if (drawBottom && bottomMode != UnifiedRulerTicksMode.none) {
      _paintSide(
        canvas: canvas,
        size: size,
        isLeft: false,
        mode: bottomMode,
        step: bottomStep,
        pattern: bottomPatternHeights,
        margin: bottomMargin,
        strokeWidth: bottomStrokeWidth,
        color: bottomColor,
        angleDeg: bottomAngleDeg,
        direction: bottomDirection,
      );
    }
  }

  // =====================================================
  // الرسم الأفقي العادي (Top/Bottom)
  // =====================================================
  void _paintUnifiedRulerTicks({
    required Canvas canvas,
    required Size size,
    required bool isTop,
    required UnifiedRulerTicksMode mode,
    required double step,
    required List<double> pattern,
    required double margin,
    required double strokeWidth,
    required Color color,
    required double angleDeg,
    required DiagonalDirection direction,
  }) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;
    final half = strokeWidth / 2;

    if (mode == UnifiedRulerTicksMode.horizontal) {
      int i = 0;
      for (double x = half; x <= size.width; x += step, i++) {
        final h = pattern[i % pattern.length];
        if (isTop) {
          canvas.drawLine(Offset(x, margin + half), Offset(x, margin + h + half), paint);
        } else {
          final y1 = size.height - margin - half;
          canvas.drawLine(Offset(x, y1 - h), Offset(x, y1), paint);
        }
      }
      return;
    }

    if (mode == UnifiedRulerTicksMode.diagonal) {
      final rad = (angleDeg.clamp(0, 180)) * math.pi / 180.0;
      final sign = direction == DiagonalDirection.downRight ? 1.0 : -1.0;
      final ux = sign * math.cos(rad);
      final uy = math.sin(rad);

      int i = 0;
      for (double x = half; x <= size.width; x += step, i++) {
        final h = pattern[i % pattern.length];
        if (isTop) {
          final y0 = margin + half;
          canvas.drawLine(Offset(x, y0), Offset(x + ux * h, y0 + uy * h), paint);
        } else {
          final y1 = size.height - margin - half;
          canvas.drawLine(Offset(x - ux * h, y1 - uy * h), Offset(x, y1), paint);
        }
      }
    }
  }

  // =====================================================
  // الرسم الرأسي (Left/Right)
  // =====================================================
  void _paintSide({
    required Canvas canvas,
    required Size size,
    required bool isLeft,
    required UnifiedRulerTicksMode mode,
    required double step,
    required List<double> pattern,
    required double margin,
    required double strokeWidth,
    required Color color,
    required double angleDeg,
    required DiagonalDirection direction,
  }) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;
    final half = strokeWidth / 2;

    if (mode == UnifiedRulerTicksMode.horizontal) {
      int i = 0;
      for (double y = half; y <= size.height; y += step, i++) {
        final h = pattern[i % pattern.length];
        if (isLeft) {
          canvas.drawLine(Offset(margin + half, y), Offset(margin + h + half, y), paint);
        } else {
          final x1 = size.width - margin - half;
          canvas.drawLine(Offset(x1 - h, y), Offset(x1, y), paint);
        }
      }
      return;
    }

    if (mode == UnifiedRulerTicksMode.diagonal) {
      final rad = (angleDeg.clamp(0, 180)) * math.pi / 180.0;
      final sign = direction == DiagonalDirection.downRight ? 1.0 : -1.0;
      final uy = math.cos(rad);
      final ux = math.sin(rad);

      int i = 0;
      for (double y = half; y <= size.height; y += step, i++) {
        final h = pattern[i % pattern.length];
        if (isLeft) {
          final x0 = margin + half;
          canvas.drawLine(Offset(x0, y), Offset(x0 + ux * h, y + uy * h), paint);
        } else {
          final x1 = size.width - margin - half;
          canvas.drawLine(Offset(x1 - ux * h, y - uy * h), Offset(x1, y), paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant UnifiedRulerTicksPainter old) {
    return isVertical != old.isVertical ||
        drawTop != old.drawTop ||
        drawBottom != old.drawBottom ||
        topMode != old.topMode ||
        bottomMode != old.bottomMode ||
        topStep != old.topStep ||
        bottomStep != old.bottomStep ||
        topColor != old.topColor ||
        bottomColor != old.bottomColor ||
        topAngleDeg != old.topAngleDeg ||
        bottomAngleDeg != old.bottomAngleDeg ||
        topDirection != old.topDirection ||
        bottomDirection != old.bottomDirection;
  }
}
