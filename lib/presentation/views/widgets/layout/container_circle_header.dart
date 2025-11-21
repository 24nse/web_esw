
import 'package:flutter/material.dart';

class ContainerCircleHeader extends StatelessWidget {
  final AnimationController controller;

  const ContainerCircleHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [

        // الدائرة الخارجية الدوارة
        // AnimatedBuilder(
        //   animation: controller,
        //   builder: (context, child) {
        //     return Transform.rotate(
        //       angle: controller.value * 2 * math.pi,
        //       child: child,
        //     );
        //   },
        //   child:
        Container(
          height: 120,
          width: 120,

          decoration: BoxDecoration(
            image: DecorationImage(image:AssetImage("assets/images/i1.png"),fit: BoxFit.cover ),
            shape: BoxShape.circle,
            // border: Border.all(
            //   color: Color(0xFF001F5C).withOpacity(0.3),
            //   width: 2,
            //   strokeAlign: BorderSide.strokeAlignOutside,
            // ),
          ),
          // ),
        ),

        // الدائرة الداخلية
        Positioned(
          left: 50,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color:  Colors.white,
              // color: const Color(0xFF001F5C),

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
            child: Container(
              child: Image.asset("assets/images/logo.png",fit: BoxFit.cover,),
            ),
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       width: 40,
            //       height: 40,
            //       decoration: const BoxDecoration(
            //         color: Color(0xFFFF6B2C),
            //         shape: BoxShape.circle,
            //       ),
            //       child: const Icon(
            //         Icons.arrow_back,
            //         color: Colors.white,
            //         size: 20,
            //       ),
            //     ),
            //     const SizedBox(height: 8),
            //     const Text(
            //       'تواصل',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 12,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     const Text(
            //       'معنا',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 10,
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ],
    );
  }
}
