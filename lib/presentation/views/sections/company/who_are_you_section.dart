
import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

import 'package:web_site/common/utils/responsive_helper.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';

import '../../../../core/responsive/responsive.dart';
import '../../widgets/common/title_section.dart';

class WhoAreYou extends StatelessWidget {
  const WhoAreYou({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
        maxWidth: ResponsiveHelper.getMaxWidth(context),
        ),
        child: Padding(
        padding: EdgeInsets.symmetric(
        horizontal:
        ResponsiveHelper.getHorizontalPadding(context),
        ),
            child: Column(

              children: [
                SizedBox(height: 20,),

                TitleSection(
                  title:  'من نحن',
                  des1: 'نحن شركة متخصصة في تنفيذ المشاريع السكنية والتجارية ',
                  des2: 'مع التركيز على الجودة والابتكار لتقديم أفضل الحلول لعملائنا.',


                  colordse1:  Colors.black,
                  colordse2: AppColors.primary,
                ),

                     SizedBox(height: 20,),
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildImage(context)),
                        const SizedBox(width: 32),
                        const Expanded(child: MissionContainer()),
                      ],
                    )
              ],
            ),
          ),
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
            height: Responsive.value(
              context: context,
                mobile: 200,
                tablet: 240,
                desktop: 280,
            ),
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
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
              boxShadow: AppShadows.card,
            ),
            child: const AppText(
              "25+ سنة خبرة",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
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
    final minHeight = Responsive.value<double>(
      context: context,
      mobile: 200,
      tablet: 240,
      desktop: 280,
    );

    final paddingMain = Responsive.value<EdgeInsets>(
      context: context,
      mobile: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      tablet: const EdgeInsets.fromLTRB(25, 30, 25, 20),
      desktop: const EdgeInsets.fromLTRB(32, 36, 32, 24),
    );

    final bottomPadding = Responsive.value<EdgeInsets>(
      context: context,
      mobile: const EdgeInsets.fromLTRB(16, 12, 14, 18),
      tablet: const EdgeInsets.fromLTRB(25, 15, 20, 25),
      desktop: const EdgeInsets.fromLTRB(32, 18, 28, 30),
    );

    final bodyFont = Responsive.value<double>(
      context: context,
      mobile: 13,
      tablet: 14,
      desktop: 15,
    );

    final titleFont = Responsive.value<double>(
      context: context,
      mobile: 18,
      tablet: 20,
      desktop: 22,
    );

    final circleSize = Responsive.value<double>(
      context: context,
      mobile: 36,
      tablet: 40,
      desktop: 44,
    );

    final iconAddSize = Responsive.value<double>(
      context: context,
      mobile: 20,
      tablet: 22,
      desktop: 24,
    );

    final iconArrowSize = Responsive.value<double>(
      context: context,
      mobile: 18,
      tablet: 20,
      desktop: 22,
    );

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minHeight),
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
          Positioned(
            right: 0.5,
            top: 16,
            bottom: 14,
            child: Container(
              width: 6,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: paddingMain,
                child: AppText(
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  'نحن شركة رائدة في مجال المقاولات العامة، نقدم حلولاً متكاملة لمشاريع البناء والتشييد. نلتزم بأعلى معايير الجودة والسلامة في تنفيذ المشاريع السكنية والتجارية والصناعية بكفاءة واحترافية عالية.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: bodyFont,
                    height: 1.6,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Container(
                padding: bottomPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: AppText(
                        'مهمتنا',
                        useFittedBox: true,
                        alignment: Alignment.centerRight,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: titleFont,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: circleSize,
                          height: circleSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: iconAddSize,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        Container(
                          width: circleSize,
                          height: circleSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: iconArrowSize,
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


