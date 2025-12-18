import 'package:flutter/material.dart';

import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';
import 'package:web_site/presentation/views/widgets/buttons/play_button.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/widgets/common/section_title.dart';

import 'package:web_site/common/utils/responsive_helper.dart';
import 'package:web_site/presentation/views/widgets/common/base_section.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return LightSection(
      sectionTitle: "لماذا تختارنا",
      titleDescription1: "بناء الثقة،",
      titleDescription2: 'تقديم خدمات ممتازة',
      children: [
        if (isMobile)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              _LeftImagePanel(mobileHeight: 260),
              SizedBox(height: 24),
              _RightFeaturesCard(stretch: false),
            ],
          )
        else
          SizedBox(
            height: isTablet ? 400 : 450,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: _LeftImagePanel(),
                ),
                const SizedBox(width: 40),
                Expanded(
                  flex: 6,
                  child: _RightFeaturesCard(stretch: true),
                ),
              ],
            ),
          ),
      ],
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
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



