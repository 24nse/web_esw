import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_site/theme/tokens.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          _AboutHero(),
          _AboutIntro(),
          _VisionMission(),
          _CoreValues(),
          _StatsSection(),
        ],
      ),
    );
  }
}

class _AboutHero extends StatelessWidget {
  const _AboutHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppGradients.hero,
      ),
      child: Center(
        child: Text(
          "من نحن",
          // style: GoogleFonts.cairo(
          //   fontSize: 36,
          //   fontWeight: FontWeight.w800,
          //   color: Colors.white,
          // ),
        ),
      ),
    );
  }
}

class _AboutIntro extends StatelessWidget {
  const _AboutIntro();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgG,
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
      child:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("شركة المقاولات والعقارات",
                        // style: GoogleFonts.cairo(
                        //   fontSize: 28,
                        //   fontWeight: FontWeight.w800,
                        //   color: AppColors.text,
                        // )
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "نحن شركة رائدة في مجال المقاولات والعقارات..."
                          " نسعى لتقديم أعلى مستويات الجودة...",
                      // style: GoogleFonts.cairo(
                      //   fontSize: 16,
                      //   color: AppColors.textMuted,
                      //   height: 1.6,
                      // ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              ClipRRect(
                borderRadius: AppRadii.lg,
                // child: Image.asset(
                //   // "assets/images/about_intro.jpg",
                //   // width: 400,
                //   // fit: BoxFit.cover,
                // ),
              ),
            ],
          ),

    );
  }
}

class _VisionMission extends StatelessWidget {
  const _VisionMission();

  @override
  Widget build(BuildContext context) {
    final items = [
      ("رؤيتنا", "أن نكون الخيار الأول في مجال المقاولات والعقارات."),
      ("رسالتنا", "تقديم خدمات متميزة تعكس الجودة والالتزام."),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
      child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items.map((e) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: AppRadii.md,
                    boxShadow: AppShadows.card,
                  ),
                  child: Column(
                    children: [
                      Text(e.$1,
                          // style: GoogleFonts.cairo(
                          //   fontSize: 22,
                          //   fontWeight: FontWeight.w800,
                          //   color: AppColors.primary,
                          // )
                      ),
                      const SizedBox(height: 12),
                      Text(e.$2,
                          textAlign: TextAlign.center,
                          // style: GoogleFonts.cairo(
                          //     fontSize: 16, color: AppColors.textMuted)
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

    );
  }
}

class _CoreValues extends StatelessWidget {
  const _CoreValues();

  @override
  Widget build(BuildContext context) {
    final values = [
      ("الجودة", Icons.check_circle),
      ("الالتزام", Icons.access_time),
      ("الابتكار", Icons.lightbulb),
      ("النزاهة", Icons.handshake),
    ];
    return Container(
      color: AppColors.bgG,
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
      child:  Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: values.map((e) {
              return Container(
                width: 220,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: AppRadii.md,
                  boxShadow: AppShadows.card,
                ),
                child: Column(
                  children: [
                    Icon(e.$2, size: 40, color: AppColors.primary),
                    const SizedBox(height: 12),
                    Text(e.$1,
                        // style: GoogleFonts.cairo(
                        //   fontSize: 18,
                        //   fontWeight: FontWeight.w700,
                        //   color: AppColors.text,
                        // )
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

    );
  }
}

class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    final stats = [
      ("+50", "مشروع مكتمل"),
      ("+20", "سنوات خبرة"),
      ("+100", "عميل سعيد"),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      decoration: const BoxDecoration(gradient: AppGradients.hero),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: stats.map((e) {
              return Column(
                children: [
                  Text(e.$1,
                      // style: GoogleFonts.cairo(
                      //   fontSize: 32,
                      //   fontWeight: FontWeight.w900,
                      //   color: Colors.white,
                      // )
                  ),
                  Text(e.$2,
                      // style: GoogleFonts.cairo(
                      //   fontSize: 16,
                      //   color: Colors.white70,
                      // )
                  ),
                ],
              );
            }).toList(),
          ),

    );
  }
}
