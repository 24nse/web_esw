import 'package:flutter/material.dart';

class TopCornerClipper extends CustomClipper<Path> {
  final double clipSize;
  final double topRadius;
  final double sideRadius;
  final bool isRight; // إذا true يقص من الأعلى يمين
  final bool isLeft;  // إذا true يقص من الأعلى يسار

  TopCornerClipper({
    this.clipSize = 40,
    this.topRadius = 8,
    this.sideRadius = 8,
    this.isRight = false,
    this.isLeft = false,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    if (isRight) {
      // قص الزاوية العليا اليمنى
      path.moveTo(0, 0);
      path.lineTo(size.width - clipSize - topRadius, 0);
      path.quadraticBezierTo(
        size.width - clipSize, 0,
        size.width - clipSize + topRadius, topRadius,
      );
      path.lineTo(size.width - sideRadius, clipSize - sideRadius);
      path.quadraticBezierTo(
        size.width, clipSize,
        size.width, clipSize + sideRadius,
      );
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.lineTo(0, 0);
      path.close();
    } else if (isLeft) {
      // قص الزاوية العليا اليسرى
      path.moveTo(clipSize, 0);
      path.quadraticBezierTo(
        clipSize - topRadius, 0,
        clipSize - topRadius, topRadius,
      );
      path.lineTo(sideRadius, clipSize - sideRadius);
      path.quadraticBezierTo(
        0, clipSize,
        0, clipSize + sideRadius,
      );
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
      path.close();
    } else {
      // بدون قص
      path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


// import 'package:flutter/material.dart';
//
// class TopRightCornerClipper extends CustomClipper<Path> {
//   final double clipSize;
//   final double topRadius; // نصف قطر النقطة العلوية
//   final double rightRadius; // نصف قطر النقطة اليمنى
//
//   TopRightCornerClipper({
//     this.clipSize = 40,
//     this.topRadius = 8,
//     this.rightRadius = 8,
//   });
//
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//
//     // نبدأ من الزاوية العلوية اليسرى
//     path.moveTo(0, 0);
//
//     // الخط العلوي إلى بداية القص (مع حساب الـ radius)
//     path.lineTo(size.width - clipSize - topRadius, 0);
//
//     // منحنى النقطة العلوية (بداية القص)
//     path.quadraticBezierTo(
//       size.width - clipSize, 0, // نقطة التحكم
//       size.width - clipSize + topRadius, topRadius, // نقطة النهاية
//     );
//
//     // الخط المائل
//     path.lineTo(size.width - rightRadius, clipSize - rightRadius);
//
//     // منحنى النقطة اليمنى (نهاية القص)
//     path.quadraticBezierTo(
//       size.width, clipSize, // نقطة التحكم
//       size.width, clipSize + rightRadius, // نقطة النهاية
//     );
//
//     // الخط الأيمن إلى الأسفل
//     path.lineTo(size.width, size.height);
//
//     // الخط السفلي
//     path.lineTo(0, size.height);
//
//     // الخط الأيسر للأعلى
//     path.lineTo(0, 0);
//
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
//
