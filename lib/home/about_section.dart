import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_site/theme/tokens.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.surface,
      color: AppColors.bgG,

      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
      child:  Flex(
                direction:  Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // صورة
                  Expanded(
                    flex:  1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: AppRadii.lg,
                        child: Image.network(
                          "assets/images/p.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 32, height: 32),

                  // نصوص
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment:
                       CrossAxisAlignment.start,
                      children: [
                        Text(
                          "من نحن",
                          // style: GoogleFonts.cairo(
                          //   fontSize: 28,
                          //   fontWeight: FontWeight.w800,
                          //   color: AppColors.text,
                          // ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                     '''نحن شركة رائدة ومتخصصة في تنفيذ المشاريع السكنية والتجارية بمختلف أنواعها وأحجامها،\nنعمل وفق أعلى معايير الجودة والاحترافية، مع الحرص الدائم على الالتزام بالوقت والميزانية المحددة.\n فريق عملنا يضم خبرات متنوعة تجمع بين الكفاءة الفنية والرؤية الإبداعية لتقديم قيمة مضافة حقيقية.\nهدفنا النهائي هو بناء مشاريع مستدامة تعكس التميز وتحقق الرضا الكامل لعملائنا وشركائنا.''''',
                          // style: GoogleFonts.cairo(
                          //   fontSize: 16,
                          //   color: AppColors.textMuted,
                          //   height: 1.6,
                          // ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: AppRadii.sm,
                            ),
                          ),
                          child: const Text("اعرف المزيد"),
                        ),
                      ],
                    ),
                  ),
                ],
              )

    );
  }
}
