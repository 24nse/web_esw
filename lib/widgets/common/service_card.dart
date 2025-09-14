import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_site/theme/tokens.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  const ServiceCard({super.key, required this.title, required this.description, this.icon = Icons.check});

  @override
  Widget build(BuildContext context) {
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
            child: Icon(icon, color: Colors.white),
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
            description,
            style: GoogleFonts.cairo(
              fontSize: 14,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
