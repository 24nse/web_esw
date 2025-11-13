import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

import 'package:web_site/presentation/views/widgets/common/title_section.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      ('المشاريع السكنية', 25),
      ('المشاريع التجارية', 18),
      ('الفلل والقصور', 12),
      ('البنية التحتية', 9),
      ('تشطيبات داخلية', 30),
      ('واجهات خارجية', 14),
      ('تصميم وتنفيذ', 22),
      ('صيانة وتشغيل', 40),
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 60),
      child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TitleSection(
                title:    'قطاعات أعمالنا',
              ),

              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 4;
                  if (constraints.maxWidth < 1000) crossAxisCount = 3;
                  if (constraints.maxWidth < 800) crossAxisCount = 2;
                  if (constraints.maxWidth < 520) crossAxisCount = 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 3.4,
                    ),
                    itemBuilder: (context, index) {
                      final (name, count) = categories[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColors.bgG,
                          borderRadius: AppRadii.md,
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: AppGradients.hero,
                              ),
                              child: const Icon(Icons.category, color: Colors.white),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    name,
                                    // style: GoogleFonts.cairo(
                                    //   fontWeight: FontWeight.w800,
                                    //   color: AppColors.text,
                                    // ),
                                  ),
                                  Text('$count مشروع',
                                      // style: GoogleFonts.cairo(color: AppColors.textMuted)
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.black26),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ));

  }
}
