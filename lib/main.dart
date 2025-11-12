import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:web_site/sections/completed_projects_section.dart';
import 'package:web_site/sections/contact_section.dart';
import 'package:web_site/sections/faq_section.dart';
import 'package:web_site/sections/footer_section.dart';
import 'package:web_site/sections/hero_section.dart';
import 'package:web_site/sections/how_we_getIt_done_section.dart';
import 'package:web_site/sections/news_letter_section.dart';
import 'package:web_site/sections/our_latest_news_blog_sections.dart';
import 'package:web_site/sections/team_section.dart';
import 'package:web_site/sections/testimonials_section.dart';
import 'package:web_site/sections/why_choose_us_section.dart';
import 'package:web_site/ser.dart';
import 'package:web_site/theme/tokens.dart' hide AppColors;
import 'package:web_site/who_are_you.dart';
import 'package:web_site/widgets/d.dart';

import 'home/about_section.dart';
import 'home/categories_section.dart';
import 'home/features_section.dart';
import 'home/footer.dart';
import 'home/header.dart';
import 'home/hero_section.dart';
import 'home/pricing_section.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شركة المقاولات والعقارات',
      //theme: ThemeData(
     //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
     //   scaffoldBackgroundColor: Colors.white,
        // textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme).apply(
        //   bodyColor: AppColors.text,
        //   displayColor: AppColors.text,
        // ),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.p),
      //   scaffoldBackgroundColor: Colors.white,
      //   fontFamily: 'Cairo', // Set Cairo as the default font for the entire app
      //   textTheme: Theme.of(context).textTheme.apply(
      //     bodyColor: AppColors.text,
      //     displayColor: AppColors.text,
      //   ),
      // ),


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
      home: const HomePage(),
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
//     '654 - اسم الوحدة المالية',
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
//                   'الوحدة المالية *',
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
