import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_site/theme/tokens.dart';

class NavItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const NavItem({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: GoogleFonts.cairo(
            color: AppColors.text,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
