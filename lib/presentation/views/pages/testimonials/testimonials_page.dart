import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../sections/landing/footer_section.dart';
import '../../sections/testimonials/testimonials_grid_section.dart';
import '../../widgets/common/page_hero_section.dart';

/// Testimonials page displaying client reviews and experiences
/// Based on the design pattern with hero section and testimonial grid
class TestimonialsPage extends StatelessWidget {
  const TestimonialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgW,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Page header with breadcrumb
              PageHeroSection(
                title: 'آراء العملاء',
                breadcrumbItems: const [
                  BreadcrumbItem(label: 'الرئيسية'),
                  BreadcrumbItem(label: 'آراء العملاء', isActive: true),
                ],
              ),

              // Testimonials Grid Section
              const TestimonialsGridSection(),

              // Footer
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
