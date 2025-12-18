import 'package:flutter/material.dart';
import '../base/base_page.dart';
import '../../sections/testimonials/testimonials_grid_section.dart';
import '../../widgets/common/page_hero_section.dart';

/// Testimonials page displaying client reviews and experiences
/// Uses BasePage template for consistent layout
class TestimonialsPage extends StatelessWidget {
  const TestimonialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'آراء العملاء',
      breadcrumbItems: const [
        BreadcrumbItem(label: 'الرئيسية'),
        BreadcrumbItem(label: 'آراء العملاء', isActive: true),
      ],
      constrainContent: false, // Section handles its own constraints
      children: const [
        TestimonialsGridSection(),
      ],
    );
  }
}
