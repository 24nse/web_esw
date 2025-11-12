
// دائرة "تواصل معنا" الدوارة
import 'dart:math' as math;

import 'package:flutter/material.dart';

class RotatingContactCircle extends StatelessWidget {
  final AnimationController controller;

  const RotatingContactCircle({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [


          // الدائرة الخارجية الدوارة
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: controller.value * 2 * math.pi,
                child: child,
              );
            },
            child: Container(
              height: 120,
              width: 120,

              decoration: BoxDecoration(

                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF001F5C).withOpacity(0.3),
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
            ),
          ),

          // الدائرة الداخلية
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: const Color(0xFF001F5C),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF6B2C),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'تواصل',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo"
                  ),
                ),
                const Text(
                  'معنا',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                      fontFamily: "Cairo"

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}