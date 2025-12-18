

import 'package:flutter/material.dart';

import '../../../../common/constants/theme/tokens.dart';
import '../../sections/company/who_are_you_section.dart';
import '../../sections/landing/contact_section.dart';
import '../../sections/landing/footer_section.dart';
import '../../sections/landing/how_we_get_it_done_section.dart';
import '../../widgets/common/page_hero_section.dart';

/// Team Details page displaying team member profile, skills, and contact form
class ContactUsPage extends StatefulWidget {

  const ContactUsPage({
    super.key,
  });

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {

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
                title: 'تواصل معنا',
                breadcrumbItems: const [
                  BreadcrumbItem(label: 'الرئيسية', ),
                  BreadcrumbItem(label: 'تواصل معنا'),
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
                          ContactSection(
                            backgroundColor: AppColors.bgW,
                          ),
                          Container(
                            height: 400,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: Image.asset(
                                "assets/images/location.jpeg",
                            fit: BoxFit.fill,
                            ),
                          )
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
