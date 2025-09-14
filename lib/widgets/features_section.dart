import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_site/theme/tokens.dart';

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
      color: AppColors.bg,
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'خدماتنا',
                style: GoogleFonts.cairo(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'حلول متكاملة في المقاولات والعقارات من التصميم إلى التسليم بإتقان وشفافية.',
                style: GoogleFonts.cairo(
                  fontSize: 16,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 4;
                  if (constraints.maxWidth < 1000) crossAxisCount = 2;
                  if (constraints.maxWidth < 600) crossAxisCount = 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: features.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 1.6,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final (title, desc) = features[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: AppRadii.md,
                          border: Border.all(color: AppColors.border),
                          boxShadow: AppShadows.card,
                        ),
                        padding: const EdgeInsets.all(20),
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
                              title,
                              style: GoogleFonts.cairo(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: AppColors.text,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              desc,
                              style: GoogleFonts.cairo(
                                fontSize: 14,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
