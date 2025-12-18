import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/pages/about/about_page.dart';
import 'package:web_site/presentation/views/pages/blogs/news_blog_page.dart';
import 'package:web_site/presentation/views/pages/contact_us/contact_us_page.dart';
import 'package:web_site/presentation/views/pages/projects/projects_page.dart';
import 'package:web_site/presentation/views/pages/team_details/team_details_page.dart';
import 'package:web_site/presentation/views/pages/testimonials/testimonials_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: AppGradients.hero,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.business, color: AppColors.primary, size: 30),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'شركة الوعل',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.home,
                    title: 'الرئيسية',
                    onTap: () => Navigator.pushReplacementNamed(context, '/'),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.info,
                    title: 'من نحن',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage())),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.miscellaneous_services,
                    title: 'خدماتنا',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TestimonialsPage())),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.work,
                    title: 'مشاريعنا',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProjectsPage())),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.article,
                    title: 'مدونتنا',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsBlogPage())),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.contact_support,
                    title: 'تواصل معنا',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsPage())),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
                ),
                child: const Text('اطلب عرض سعر'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer
        onTap();
      },
    );
  }
}
