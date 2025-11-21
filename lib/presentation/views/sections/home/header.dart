import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/pages/about/about_page.dart';
import 'package:web_site/presentation/views/widgets/common/nav_item.dart';

import '../../pages/project_details/project_details_page.dart';

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
                    'شركة الوعل المقاولات والعقارات',
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Nav items (simplified)
            NavItem(
              title: 'خدماتنا',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            NavItem(
              title: 'مشاريعنا',
              onTap: () {
               
              },
            ),
             NavItem(title: 'باقاتنا',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProjectDetailsPage()),
                );
              },
            ),
            const NavItem(title: 'تواصل معنا'),
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
