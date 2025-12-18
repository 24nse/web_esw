

import 'package:flutter/material.dart';

import '../../../../common/constants/theme/tokens.dart';
import '../../sections/company/who_are_you_section.dart';
import '../../sections/landing/faq_section.dart';
import '../../sections/landing/footer_section.dart';
import '../../sections/landing/how_we_get_it_done_section.dart';
import '../../widgets/common/page_hero_section.dart';

/// Team Details page displaying team member profile, skills, and contact form
class FaqsPage extends StatefulWidget {

  const FaqsPage({
    super.key,
  });

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgW,
      body: SafeArea(
        child:

        SingleChildScrollView(
          child: Column(
            children: [
              // Page header with breadcrumb
              PageHeroSection(
                title: 'اسئلة',
                breadcrumbItems: const [
                  BreadcrumbItem(label: 'الرئيسية', ),
                  BreadcrumbItem(label: 'من نحن'),
                ],
              ),

              // Main content with max width constraint
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                         FaqSection( backgroundColor: AppColors.bgW,),
                      ],
                    ),
                  ),
                ),
              ),

              // Footer
              const FooterSection(),

            ],
          ),
        ),
      ),
    );
  }
}
