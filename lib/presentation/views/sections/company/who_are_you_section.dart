
import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/pages/about/about_page.dart';
import 'package:web_site/presentation/views/widgets/common/section_title.dart';

import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';

import 'package:web_site/common/utils/responsive_helper.dart';
import 'package:web_site/presentation/views/widgets/common/base_section.dart';

class WhoAreYou extends StatelessWidget {
  const WhoAreYou({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteSection(
      sectionTitle: 'من نحن',
      titleDescription1: 'نحن شركة متخصصة في تنفيذ المشاريع السكنية والتجارية ',
      titleDescription2: 'مع التركيز على الجودة والابتكار لتقديم أفضل الحلول لعملائنا.',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < ResponsiveHelper.mobileBreakpoint;

            return Row(
              // direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                if (isMobile)
                  Expanded(child: _buildImage(context))
                else
                  _buildImage(context),

                // Spacing between Image and Mission
                SizedBox(
                  width: isMobile ? 0 : 32,
                  height: isMobile ? 24 : 0,
                ),

                // Mission Section
                if (isMobile)
                  const Expanded(child: MissionContainer())
                else
                  const MissionContainer(),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: TopRightCornerClipper(
            clipSize: 70,
            topRadius: 8,
            rightRadius: 8,
          ),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/p.jpg"),
                fit: BoxFit.cover,
              ),
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 12,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
                boxShadow: AppShadows.card,
              ),
              child: const Text(
                "25+ سنة خبرة",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TopRightCornerClipper extends CustomClipper<Path> {
  final double clipSize;
  final double topRadius; // نصف قطر النقطة العلوية
  final double rightRadius; // نصف قطر النقطة اليمنى

  TopRightCornerClipper({
    this.clipSize = 40,
    this.topRadius = 8,
    this.rightRadius = 8,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    // نبدأ من الزاوية العلوية اليسرى
    path.moveTo(0, 0);

    // الخط العلوي إلى بداية القص (مع حساب الـ radius)
    path.lineTo(size.width - clipSize - topRadius, 0);

    // منحنى النقطة العلوية (بداية القص)
    path.quadraticBezierTo(
      size.width - clipSize, 0, // نقطة التحكم
      size.width - clipSize + topRadius, topRadius, // نقطة النهاية
    );

    // الخط المائل
    path.lineTo(size.width - rightRadius, clipSize - rightRadius);

    // منحنى النقطة اليمنى (نهاية القص)
    path.quadraticBezierTo(
      size.width, clipSize, // نقطة التحكم
      size.width, clipSize + rightRadius, // نقطة النهاية
    );

    // الخط الأيمن إلى الأسفل
    path.lineTo(size.width, size.height);

    // الخط السفلي
    path.lineTo(0, size.height);

    // الخط الأيسر للأعلى
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class MissionContainer extends StatelessWidget {
  const MissionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 250),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1E4D),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // العمود البرتقالي على اليسار
          Positioned(
            right: 0.5,
            top: 16,
            bottom: 14,
            child: Container(
              width: 6,
              decoration: BoxDecoration(
                color: AppColors.primary,  // اللون البرتقالي
                // color: Color(0xFFFF6B4A),  // اللون البرتقالي
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
          ),

          // المحتوى الرئيسي
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // النص الرئيسي
              const Padding(
                padding: EdgeInsets.fromLTRB(25, 30, 25, 20),
                child: Text(
                  'نحن شركة رائدة في مجال المقاولات العامة، نقدم حلولاً متكاملة لمشاريع البناء والتشييد. نلتزم بأعلى معايير الجودة والسلامة في تنفيذ المشاريع السكنية والتجارية والصناعية بكفاءة واحترافية عالية.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.6,
                    letterSpacing: 0.3,
                  ),
                ),
              ),

              // قسم "Our Mission" مع الأزرار
              Container(
                padding: const EdgeInsets.fromLTRB(25, 15, 20, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // عنوان "Our Mission"
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Text(
                          'مهمتنا',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // الأزرار
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // زر Plus في دائرة مع حدود
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // زر السهم في دائرة برتقالية
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


