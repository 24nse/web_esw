import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_site/theme/tokens.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.text,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 48,
                runSpacing: 24,
                children: const [
                  _FooterColumn(
                    title: 'روكت LMS',
                    items: [
                      'من نحن',
                      'المدونة',
                      'الوظائف',
                    ],
                  ),
                  _FooterColumn(
                    title: 'تعلّم',
                    items: [
                      'الدورات',
                      'التصنيفات',
                      'الأسعار',
                    ],
                  ),
                  _FooterColumn(
                    title: 'الدعم',
                    items: [
                      'مركز المساعدة',
                      'تواصل معنا',
                      'الشروط والخصوصية',
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Divider(color: Colors.white.withOpacity(0.1)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    '© ${DateTime.now().year} روكت LMS. جميع الحقوق محفوظة.',
                    // style: GoogleFonts.cairo(color: Colors.white70),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(Icons.facebook, color: Colors.white70),
                      const SizedBox(width: 12),
                      Icon(Icons.alternate_email, color: Colors.white70),
                      const SizedBox(width: 12),
                      Icon(Icons.play_circle, color: Colors.white70),
                    ],
                  )
                ],
              )
            ],
          ),

    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;
  const _FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            // style: GoogleFonts.cairo(
            //   fontSize: 18,
            //   color: Colors.white,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
          const SizedBox(height: 12),
          ...items.map((e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  e,
                  // style: GoogleFonts.cairo(color: Colors.white70),
                ),
              )),
        ],
      ),
    );
  }
}
