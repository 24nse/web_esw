import 'package:flutter/material.dart';

import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';
import 'package:web_site/presentation/views/widgets/buttons/play_button.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/widgets/common/section_title.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // زخرفة المسطرة أعلى/أسفل
    final ticks = UnifiedRulerTicksPainter(
      // أعلى أفقي
      drawTop: true,
      topMode: UnifiedRulerTicksMode.horizontal,
      topStep: 10,
      topPatternHeights: const [14, 6, 10, 6, 14],
      topMargin: 0,
      topStrokeWidth: 1,
      topColor: const Color(0xFFD1D5DB),
      // أسفل أفقي
      drawBottom: true,
      bottomMode: UnifiedRulerTicksMode.horizontal,
      bottomStep: 10,
      bottomPatternHeights: const [14, 6, 10, 6, 14],
      bottomMargin: 0,
      bottomStrokeWidth: 1,
      bottomColor: const Color(0xFFD1D5DB),
    );

    return LayoutBuilder(
      builder: (context, cons) {
        final w = cons.maxWidth;
        final isDesktop = w >= 1100;
        final isTablet = w >= 800 && w < 1100;
        // ارتفاع موحّد للعمودين على الشاشات العريضة
        final double sectionHeight = isDesktop ? 360 : (isTablet ? 300 : 0);

        // إعدادات الصورة العائمة
        const double leftOffset = 24;
        const double bottomOffset = -40;
        const double floatSize = 100;

        final sectionBody = Container(
          padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 60),
          color: Colors.grey[50],
          child: Column(
            children: [
              const SectionTitle(
                title: "لماذا تختارنا",
                subTitle: "بناء الثقة،",
                subTitle1: 'تقديم خدمات ممتازة',
              ),
              const SizedBox(height: AppSpaces.lg),

              // Responsive: صف على العريض، تكديس على الموبايل
              if (isDesktop || isTablet)
                SizedBox(
                  height: sectionHeight, // ← ارتفاع موحّد
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // ملء الارتفاع
                    children: [
                      // العمود الأيسر (الصورة)
                      Expanded(
                        flex: 5,
                        child: _LeftImagePanel(),
                      ),
                      const SizedBox(width: 40),
                      // العمود الأيمن (كرت الميزات) — يتمدد رأسيًا بالكامل
                      Expanded(
                        flex: 6,
                        child: _RightFeaturesCard(stretch: true),
                      ),
                    ],
                  ),
                )
              else
              // موبايل: تكديس عمودي نظيف
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    _LeftImagePanel(mobileHeight: 260),
                    SizedBox(height: 20),
                    _RightFeaturesCard(stretch: false),
                  ],
                ),
            ],
          ),
        );

        return Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(foregroundPainter: ticks, child: sectionBody),
            //
            // // الصورة الدائرية العائمة
            // Positioned(
            //   left: leftOffset,
            //   bottom: bottomOffset,
            //   child: SizedBox(
            //     width: floatSize,
            //     height: floatSize,
            //     child: DecoratedBox(
            //       decoration: BoxDecoration(
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black.withOpacity(0.12),
            //             blurRadius: 12,
            //             offset: const Offset(0, 6),
            //           ),
            //         ],
            //       ),
            //       child: ClipOval(
            //         child: Image.asset(
            //           "assets/images/p1.png",
            //           fit: BoxFit.cover,
            //           errorBuilder: (_, __, ___) => Icon(
            //             Icons.person,
            //             color: Colors.grey[400],
            //             size: 40,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}

/* ======================== Left Panel (Image) ======================== */

class _LeftImagePanel extends StatelessWidget {
  final double? mobileHeight;
  const _LeftImagePanel({this.mobileHeight});

  @override
  Widget build(BuildContext context) {
    // إذا كنا على موبايل، نحدد ارتفاعاً أصغر؛ على العريض نتمدّد بالكامل
    final bool isMobile = MediaQuery.sizeOf(context).width < 800;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: isMobile ? mobileHeight ?? 260 : double.infinity, // ← هنا السر
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: AppShadows.card,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // الخلفية/الصورة
            DecoratedBox(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/p2.png"),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFE5E7EB), Color(0xFFF3F4F6)],
                ),
              ),
            ),
            // زر التشغيل
            const Center(child: PlayButton()),
          ],
        ),
      ),
    );
  }
}

/* ======================== Right Panel (Features Card) ======================== */

class _RightFeaturesCard extends StatelessWidget {
  final bool stretch; // يتمدد رأسيًا لملء الارتفاع
  const _RightFeaturesCard({required this.stretch});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A1F44),
        borderRadius: AppRadii.lg,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0A1F44).withOpacity(0.28),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Stack(
        children: [
          // الشريط البرتقالي (جهة اليمين في RTL)
          Positioned(
            right: 0.7,
            top: 16,
            bottom: 14,
            child: Container(
              width: 6,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
          ),

          // محتوى الميزات: Scroll عند الحاجة (في الأجهزة الأقل ارتفاعًا)
          Padding(
            padding: const EdgeInsets.all(28),
            child: LayoutBuilder(
              builder: (context, c) {
                final content = Column(
                  children: const [
                    FeatureItem(
                      icon: Icons.settings_suggest,
                      title: 'تقنية متقدمة',
                      description:
                      'نستخدم أحدث التقنيات والمعدات في جميع مشاريعنا لضمان أعلى جودة في البناء والتشييد',
                    ),
                    Divider(height: 13, thickness: 1, color: Colors.grey),
                    SizedBox(height: 24),
                    FeatureItem(
                      icon: Icons.people,
                      title: 'فريق خبراء',
                      description:
                      'فريق عمل محترف من المهندسين والفنيين ذوي الخبرة الطويلة في مجال المقاولات والعقارات',
                    ),
                    Divider(height: 13, thickness: 1, color: Colors.grey),
                    SizedBox(height: 24),
                    FeatureItem(
                      icon: Icons.access_time,
                      title: 'تسليم في الوقت المحدد',
                      description:
                      'التزامنا بمواعيد التسليم المحددة دون أي تأخير، مع الحفاظ على أعلى معايير الجودة',
                    ),
                    Divider(height: 13, thickness: 1, color: Colors.grey),
                    SizedBox(height: 24),
                    FeatureItem(
                      icon: Icons.emoji_events,
                      title: 'حائز على جوائز',
                      description:
                      'حصلنا على العديد من الجوائز المحلية والدولية تقديراً لتميزنا في مجال البناء والتطوير العقاري',
                    ),
                    Divider(height: 13, thickness: 1, color: Colors.grey),
                  ],
                );

                // إذا الارتفاع المتاح صغير، نسمح بالتمرير الداخلي
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 0,
                    maxHeight: stretch ? c.maxHeight : double.infinity,
                  ),
                  child: stretch
                      ? SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: content,
                  )
                      : content,
                );
              },
            ),
          ),
        ],
      ),
    );

    // في العرض العريض: نحتاج أن يملأ الارتفاع بالكامل
    return stretch
        ? SizedBox.expand(child: card)
        : card;
  }
}

/* ======================== Feature Item (unchanged) ======================== */

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textDirection: TextDirection.rtl,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Cairo",
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.7),
                  height: 1.5,
                  fontFamily: "Cairo",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



