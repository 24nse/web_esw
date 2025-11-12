// النجوم الزخرفية
import 'package:flutter/material.dart';
import 'package:web_site/helpers/star_painter.dart';


class DecorativeStars extends StatelessWidget {
  const DecorativeStars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 150,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            right: 40,
            child: _buildStar(60, const Color(0xFFFF6B2C)),
          ),
          Positioned(
            top: 80,
            left: 60,
            child: _buildStar(25, const Color(0xFFFF6B2C)),
          ),
          Positioned(
            top: 20,
            left: 70,
            child: _buildStar(40, const Color(0xFFFF6B2C)),
          ),
        ],
      ),
    );
  }

  Widget _buildStar(double size, Color color) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 800 + (size * 10).toInt()),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: CustomPaint(
        size: Size(size, size),
        painter: StarPainter(color: color),
      ),
    );
  }
}
