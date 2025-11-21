import 'package:flutter/material.dart';
import '../../widgets/common/page_hero_section.dart';

class PageHeaderSection extends StatelessWidget {
  const PageHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageHeroSection(
      title: 'تفاصيل المشروع',
      breadcrumbItems: const [
        BreadcrumbItem(label: 'الرئيسية'),
        BreadcrumbItem(label: 'تفاصيل المشروع', isActive: true),
      ],
    );
  }
}

