import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:web_site/common/constants/theme/app_typography.dart';
import 'package:web_site/common/constants/theme/material_theme.dart';
import 'package:web_site/presentation/views/pages/blogs/news_blog_page.dart';
import 'package:web_site/presentation/views/sections/company/who_are_you_section.dart';
import 'package:web_site/presentation/views/sections/home/header.dart';
import 'package:web_site/presentation/views/sections/landing/completed_projects_section.dart';
import 'package:web_site/presentation/views/sections/landing/contact_section.dart';
import 'package:web_site/presentation/views/sections/landing/faq_section.dart';
import 'package:web_site/presentation/views/sections/landing/footer_section.dart';
import 'package:web_site/presentation/views/sections/landing/hero_section.dart';
import 'package:web_site/presentation/views/sections/landing/newsletter_section.dart';
import 'package:web_site/presentation/views/sections/landing/our_latest_news_blog_sections.dart';
import 'package:web_site/presentation/views/sections/landing/team_section.dart';
import 'package:web_site/presentation/views/sections/landing/testimonials_section.dart';
import 'package:web_site/presentation/views/sections/landing/why_choose_us_section.dart';
import 'package:web_site/presentation/views/sections/marketing/services_section.dart';
import 'package:web_site/presentation/views/pages/project_details/project_details_page.dart';
import 'package:web_site/presentation/views/pages/blog_details/blog_details_page.dart';
import 'package:web_site/presentation/views/pages/team_details/team_details_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(AppTypography.textTheme);
    return MaterialApp(
      title: 'شركة المقاولات والعقارات',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/project-details': (context) => const ProjectDetailsPage(),
        '/news-blog': (context) => const NewsBlogPage(),
        '/blog-details': (context) => const BlogDetailsPage(),
        '/team-details': (context) => const TeamDetailsPage(memberId: '1'),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(

        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // OnyxHeroSection(),
              const HeroSection(),
              const WhoAreYou(),
              // // AboutSection(),
              ServicesSection(),
              CompletedProjectsSection(),
              // // const FeaturesSection(),
              WhyChooseUsSection(),
              ContactSection(),
              TeamSection(),
              TestimonialsSection(),
              OurLatestNewsBlogSections(),
              FaqSection(),
              // const CategoriesSection(),
              // const PricingSection(),
              const NewsletterSection(),
              const FooterSection(),
            ],


    )));
  }
}
//
// import 'package:flutter/material.dart';
//
// class FinancialUnitWidget extends StatefulWidget {
//   const FinancialUnitWidget({super.key});
//
//   @override
//   State<FinancialUnitWidget> createState() => _FinancialUnitWidgetState();
// }
//
// class _FinancialUnitWidgetState extends State<FinancialUnitWidget> {
//   bool showPopup = false;
//
//   final List<String> units = [
//     '23432 - اسم الوحدة المالية',
//     '224 - اسم الوحدة المالية',
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Label
//                 const Text(
//                  'الوحدة المالية *',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black87,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//
//                 // Main field container
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey.shade300),
//                     borderRadius: BorderRadius.circular(6),
//                     color: Colors.white,
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//                   child: Row(
//                     children: [
//                       // X icon
//                       const Icon(Icons.close, size: 18, color: Colors.grey),
//                       const SizedBox(width: 4),
//
//                       // Main item
//                       Expanded(
//                         child: Wrap(
//                           crossAxisAlignment: WrapCrossAlignment.center,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(4),
//                                 color: Colors.grey.shade100,
//                               ),
//                               child: const Text(
//                                 '23432 - اسم الوحدة المالية',
//                                 style: TextStyle(fontSize: 13, color: Colors.black87),
//                               ),
//                             ),
//                             const SizedBox(width: 4),
//                             Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                               decoration: BoxDecoration(
//                                 color: Colors.blue.shade50,
//                                 borderRadius: BorderRadius.circular(4),
//                               ),
//                               child: const Text(
//                                 '+2',
//                                 style: TextStyle(
//                                   color: Colors.blue,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // Eye icon
//                       IconButton(
//                         icon: const Icon(Icons.remove_red_eye_outlined, color: Colors.blue),
//                         onPressed: () {
//                           setState(() {
//                             showPopup = !showPopup;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//             // Floating popup container
//             if (showPopup)
//               Positioned(
//                 right: 0,
//                 top: 78,
//                 child: Material(
//                   elevation: 4,
//                   borderRadius: BorderRadius.circular(8),
//                   child: Container(
//                     width: 260,
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: List.generate(units.length, (index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//                           child: Row(
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(4),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(4),
//                                   color: Colors.grey.shade100,
//                                 ),
//                                 child: const Icon(Icons.close, size: 16, color: Colors.grey),
//                               ),
//                               const SizedBox(width: 8),
//                               Expanded(
//                                 child: Text(
//                                   units[index],
//                                   style: const TextStyle(
//                                     fontSize: 13,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       }),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(const MaterialApp(
//     home: Scaffold(
//       body: Center(child: FinancialUnitWidget()),
//     ),
//   ));
// }




