import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_site/theme/tokens.dart';
import 'package:web_site/widgets/common/nav_item.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.border)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            // Logo
            Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppGradients.hero,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'شركة المقاولات والعقارات',
                    style: GoogleFonts.cairo(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.text,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Nav items (simplified)
            const NavItem(title: 'خدماتنا'),
            const NavItem(title: 'مشاريعنا'),
            const NavItem(title: 'باقاتنا'),
            const NavItem(title: 'تواصل معنا'),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: AppColors.text,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: const Text('تواصل'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
              ),
              child: const Text('اطلب عرض سعر'),
            ),
          ],
        ),
      ),
    );
  }
}
