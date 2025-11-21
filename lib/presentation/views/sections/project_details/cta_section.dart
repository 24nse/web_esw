import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

import '../../widgets/graphics/unified_ruler_ticks_painter.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Stack(
        clipBehavior: Clip.none,
      children: [

        CustomPaint(
          foregroundPainter: UnifiedRulerTicksPainter(
            // أعلى مائل
            drawTop: true,
            topMode: UnifiedRulerTicksMode.diagonal,
            topStep: 18,
            topPatternHeights: const [20],
            topAngleDeg: 60,
            topDirection: DiagonalDirection.downLeft,
            topMargin: 0,
            topStrokeWidth: 1,
            topColor: Color(0xFF5F83C8),

            // أسفل مائل
            drawBottom: true,
            bottomMode: UnifiedRulerTicksMode.diagonal,
            bottomStep: 12,
            bottomPatternHeights: const [20],
            bottomAngleDeg: 60,
            bottomDirection: DiagonalDirection.downLeft,
            bottomMargin: 0,
            bottomStrokeWidth: 1,
            bottomColor: Color(0xFF5F83C8),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(48),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF001656),
                  // Color(0xFF0A1F44),
                  Color(0xFF132D5E),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              // Diagonal pattern background
            ),
            child: Row(
              children: [
                // Left side - Text and Button
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Small label
                      Text(
                        'تواصل معنا',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Main Heading
                      RichText(
                        text:  TextSpan(
                          style: textTheme.headlineLarge?.copyWith(
                            color: Colors.white70,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),

                          children: [
                            TextSpan(
                              text: 'خطط، ابنِ، انجح –\n',
                              style: textTheme.headlineLarge?.copyWith(color: Colors.white),
                            ),
                            TextSpan(
                              text: 'استشرنا ',
                              style: textTheme.headlineLarge?.copyWith(color: Colors.white),
                            ),
                            TextSpan(
                              text: 'اليوم!',
                              style: textTheme.headlineLarge?.copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'تواصل معنا',
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
        Positioned(
            top: -100,
            left: 0,
            child:
            SizedBox(
              width: 300,
              height: 375,

              child: Image.asset("assets/images/eng1.png",fit:BoxFit.cover,),
            )
        ),

      ],
    );
  }
}
