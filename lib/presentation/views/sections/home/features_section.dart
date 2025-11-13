import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      (
        'مقاولات عامة',
        'تنفيذ مشاريع البناء والهياكل الخرسانية بجودة عالية وفق المواصفات والمعايير الفنية المعتمدة.'
      ),
      (
        'تشطيبات وديكورات',
        'تشطيبات داخلية وخارجية راقية تشمل الأرضيات والدهانات والأعمال الخشبية والجبس والواجهات.'
      ),
      (
        'صيانة وتجديد',
        'خدمات صيانة دورية وتجديد شامل للمباني والوحدات السكنية والتجارية مع التزام بالمواعيد.'
      ),
      (
        'إدارة أملاك',
        'إدارة وتشغيل العقارات والخدمات المساندة لتحسين العائد والحفاظ على أصولكم.'
      ),
    ];

    return Container(
      color: AppColors.bgG,
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
      child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'خدماتنا',
                // style: GoogleFonts.cairo(
                //   fontSize: 28,
                //   fontWeight: FontWeight.w800,
                //   color: AppColors.text,
                // ),
              ),
              const SizedBox(height: 12),
              Text(
                'حلول متكاملة في المقاولات والعقارات من التصميم إلى التسليم بإتقان وشفافية.',
                // style: GoogleFonts.cairo(
                //   fontSize: 16,
                //   color: AppColors.textMuted,
                // ),
              ),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 4;
                  if (constraints.maxWidth < 1000) crossAxisCount = 2;
                  if (constraints.maxWidth < 600) crossAxisCount = 1;

                  // Use Wrap instead of GridView to allow variable height per card on hover
                  final totalSpacing = 16.0 * (crossAxisCount - 1);
                  final itemWidth = (constraints.maxWidth - totalSpacing) / crossAxisCount;

                  return Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      for (final (title, desc) in features)
                        SizedBox(
                          width: itemWidth,
                          child: _FeatureCard(title: title, desc: desc),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),

    );
  }
}

class _FeatureCard extends StatefulWidget {
  const _FeatureCard({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _hovered = false;

  void _onEnter(dynamic e) => setState(() => _hovered = true);
  void _onExit(dynamic e) => setState(() => _hovered = false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadii.md,
          border: Border.all(color: AppColors.border),
          boxShadow: _hovered ? [...AppShadows.card, const BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))] : AppShadows.card,
        ),
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppGradients.hero,
                ),
                child: const Icon(Icons.check, color: Colors.white),
              ),
              const SizedBox(height: 12),
              Text(
                widget.title,
                // style: GoogleFonts.cairo(
                //   fontSize: 18,
                //   fontWeight: FontWeight.w800,
                //   color: AppColors.text,
                // ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.desc,
                // style: GoogleFonts.cairo(
                //   fontSize: 14,
                //   color: AppColors.textMuted,
                // ),
                maxLines: _hovered ? null : 2,
                overflow: _hovered ? TextOverflow.visible : TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
