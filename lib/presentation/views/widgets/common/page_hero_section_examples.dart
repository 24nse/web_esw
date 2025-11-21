import 'package:flutter/material.dart';
import 'package:web_site/presentation/views/widgets/common/page_hero_section.dart';

/// EXAMPLE 1: Simple hero with just title
class SimpleHeroExample extends StatelessWidget {
  const SimpleHeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return PageHeroSection(
      title: 'من نحن',
      breadcrumbItems: const [
        BreadcrumbItem(label: 'الرئيسية'),
        BreadcrumbItem(label: 'من نحن', isActive: true),
      ],
    );
  }
}

/// EXAMPLE 2: Hero with custom colors
class CustomColorHeroExample extends StatelessWidget {
  const CustomColorHeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return PageHeroSection(
      title: 'الخدمات',
      breadcrumbItems: const [
        BreadcrumbItem(label: 'الرئيسية'),
        BreadcrumbItem(label: 'خدماتنا'),
        BreadcrumbItem(label: 'الخدمات الهندسية', isActive: true),
      ],
      backgroundColor: const Color(0xFFF8FAFF),
      gradientStartColor: const Color(0xFFFF6B2C),
      gradientEndColor: const Color(0xFFFF8C4C),
    );
  }
}

/// EXAMPLE 3: Hero with custom dimensions
class CustomDimensionsHeroExample extends StatelessWidget {
  const CustomDimensionsHeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return PageHeroSection(
      title: 'اتصل بنا',
      breadcrumbItems: const [
        BreadcrumbItem(label: 'الرئيسية'),
        BreadcrumbItem(label: 'اتصل بنا', isActive: true),
      ],
      verticalPadding: 80,
      maxWidth: 1200,
    );
  }
}

/// EXAMPLE 4: Hero with multiple breadcrumb levels
class MultiBreadcrumbHeroExample extends StatelessWidget {
  const MultiBreadcrumbHeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return PageHeroSection(
      title: 'تصنيف المشاريع',
      breadcrumbItems: const [
        BreadcrumbItem(label: 'الرئيسية'),
        BreadcrumbItem(label: 'المشاريع'),
        BreadcrumbItem(label: 'المشاريع التجارية'),
        BreadcrumbItem(label: 'تصنيف المشاريع', isActive: true),
      ],
    );
  }
}

/// EXAMPLE 5: Hero for blog page
class BlogHeroExample extends StatelessWidget {
  const BlogHeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageHeroSection(
      title: 'المدونة',
      breadcrumbItems: [
        BreadcrumbItem(label: 'الرئيسية'),
        BreadcrumbItem(label: 'المدونة', isActive: true),
      ],
    );
  }
}

/// EXAMPLE 6: Hero for team page
class TeamHeroExample extends StatelessWidget {
  const TeamHeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageHeroSection(
      title: 'فريق العمل',
      breadcrumbItems: [
        BreadcrumbItem(label: 'الرئيسية'),
        BreadcrumbItem(label: 'من نحن'),
        BreadcrumbItem(label: 'فريق العمل', isActive: true),
      ],
    );
  }
}
