import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_site/theme/tokens.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextAlign align;
  const SectionTitle({super.key, required this.title, this.subtitle, this.align = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align == TextAlign.start ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: align,
          style: GoogleFonts.cairo(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.text,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subtitle!,
            textAlign: align,
            style: GoogleFonts.cairo(
              fontSize: 16,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ],
    );
  }
}
