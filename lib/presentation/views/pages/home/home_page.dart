import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../sections/home/header.dart';
import '../../sections/company/who_are_you_section.dart';
import '../../sections/landing/completed_projects_section.dart';
import '../../sections/landing/contact_section.dart';
import '../../sections/landing/faq_section.dart';
import '../../sections/landing/footer_section.dart';
import '../../sections/landing/hero_section.dart';
import '../../sections/landing/newsletter_section.dart';
import '../../sections/landing/our_latest_news_blog_sections.dart';
import '../../sections/landing/team_section.dart';
import '../../sections/landing/testimonials_section.dart';
import '../../sections/landing/why_choose_us_section.dart';
import '../../sections/marketing/services_section.dart';

/// Home page / Landing page of the website
/// Uses custom hero section instead of PageHeroSection
/// Follows unified page structure pattern
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgW,
      appBar: const Header(),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Section (custom for landing page)
            HeroSection(),

            // Who Are You Section
            WhoAreYou(),

            // Services Section
            ServicesSection(),

            // Completed Projects Section
            CompletedProjectsSection(),

            // Why Choose Us Section
            WhyChooseUsSection(),

            // Contact Section
            ContactSection(),

            // Team Section
            TeamSection(),

            // Testimonials Section
            TestimonialsSection(),

            // Latest News/Blog Section
            OurLatestNewsBlogSections(),

            // FAQ Section
            FaqSection(),

            // Newsletter Section
            NewsletterSection(),

            // Footer
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
