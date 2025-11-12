import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_site/theme/tokens.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Plan> plans = [
      Plan(
        title: 'الباقة الأساسية',
        description: 'أعمال هيكل خرساني وتشطيبات قياسية مع إشراف هندسي أساسي.',
        price: 'حسب المساحة',
        features: const [
          'تصميم أولي واستشارة',
          'هيكل خرساني وفق المواصفات',
          'تشطيبات قياسية',
          'مدة تنفيذ متفق عليها',
        ],
      ),
      Plan(
        title: 'الباقة الاحترافية',
        description: 'تشطيب فاخر مع تصميم داخلي وإدارة مشروع كاملة.',
        price: 'عرض سعر مخصص',
        features: const [
          'تصميم معماري وداخلي',
          'مواد عالية الجودة',
          'إدارة مشروع وإشراف يومي',
          'ضمان على الأعمال',
        ],
      ),
      Plan(
        title: 'الباقة الشاملة (تسليم مفتاح)',
        description: 'تنفيذ من التصميم إلى التسليم مع الصيانة بعد التسليم.',
        price: 'حسب نطاق العمل',
        features: const [
          'تصميم وتنفيذ وتسليم مفتاح',
          'تشطيبات فاخرة وواجهات',
          'إدارة موردين ومقاولين',
          'صيانة بعد التسليم',
        ],
      ),
    ];

    return Container(
      color: AppColors.bgG,
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 60),
      child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'باقات الخدمات',
                // style: GoogleFonts.cairo(
                //   fontSize: 28,
                //   fontWeight: FontWeight.w800,
                //   color: AppColors.text,
                // ),
              ),
              const SizedBox(height: 12),
              Text(
                'اختر الباقة المناسبة لمشروعك؛ جميع الباقات قابلة للتخصيص وفقاً لنطاق العمل والميزانية.',
                textAlign: TextAlign.center,
                // style: GoogleFonts.cairo(
                //   fontSize: 16,
                //   color: AppColors.textMuted,
                // ),
              ),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 3;
                  if (constraints.maxWidth < 1000) crossAxisCount = 2;
                  if (constraints.maxWidth < 700) crossAxisCount = 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: plans.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 0.95,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final plan = plans[index];

                      final highlighted = index == 1; // middle card highlight

                      return Container(
                        decoration: BoxDecoration(
                          color: highlighted ? AppColors.primary : AppColors.surface,
                          borderRadius: AppRadii.lg,
                          border: Border.all(color: highlighted ? Colors.transparent : AppColors.border),
                          boxShadow: AppShadows.card,
                        ),
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plan.title,
                              // style: GoogleFonts.cairo(
                              //   fontSize: 20,
                              //   fontWeight: FontWeight.w800,
                              //   color: highlighted ? Colors.white : AppColors.text,
                              // ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              plan.description,
                              // style: GoogleFonts.cairo(
                              //   fontSize: 14,
                              //   color: highlighted ? Colors.white70 : AppColors.textMuted,
                              // ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              plan.price,
                              // style: GoogleFonts.cairo(
                              //   fontSize: 28,
                              //   fontWeight: FontWeight.w800,
                              //   color: highlighted ? Colors.white : AppColors.text,
                              // ),
                            ),
                            const SizedBox(height: 16),
                            ...plan.features.map((f) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.check_circle, size: 18, color: highlighted ? Colors.white : AppColors.success),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          f,
                                          // style: GoogleFonts.cairo(
                                          //   color: highlighted ? Colors.white : AppColors.text,
                                          // ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            const Spacer(),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: highlighted ? Colors.white : AppColors.primary,
                                foregroundColor: highlighted ? AppColors.primary : Colors.white,
                                minimumSize: const Size(double.infinity, 48),
                                shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
                              ),
                              child: const Text('اطلب عرض سعر'),
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

    );
  }
}

class Plan {
  final String title;
  final String description;
  final String price;
  final List<String> features;
  const Plan({
    required this.title,
    required this.description,
    required this.price,
    required this.features,
  });
}
