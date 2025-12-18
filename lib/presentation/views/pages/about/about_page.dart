import 'package:flutter/material.dart';
import '../base/base_page.dart';
import '../../sections/about/awards_section.dart';
import '../../sections/about/video_showcase_section.dart';
import '../../sections/company/who_are_you_section.dart';
import '../../sections/landing/how_we_get_it_done_section.dart';
import '../../widgets/common/page_hero_section.dart';

/// About page displaying company information, video showcase, and awards
/// Uses BasePage template for consistent layout
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'من نحن',
      breadcrumbItems: const [
        BreadcrumbItem(label: 'الرئيسية'),
        BreadcrumbItem(label: 'من نحن', isActive: true),
      ],
      constrainContent: false, // Sections handle their own constraints
      children: const [
        // Who Are You Section (constrained)
        _ConstrainedContent(
          child: Column(
            children: [
              WhoAreYou(),
              SizedBox(height: 30),
              VideoShowcaseSection(),
              SizedBox(height: 60),
              HowWeGetItDoneSection(),
            ],
          ),
        ),
        // Awards Section (full width with dark background)
        AwardsSection(),
      ],
    );
  }
}

/// Helper widget for constrained content within BasePage
class _ConstrainedContent extends StatelessWidget {
  final Widget child;

  const _ConstrainedContent({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: child,
        ),
      ),
    );
  }
}
