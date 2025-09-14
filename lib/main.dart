import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:web_site/theme/tokens.dart';
import 'package:web_site/widgets/header.dart';
import 'package:web_site/widgets/hero_section.dart';
import 'package:web_site/widgets/features_section.dart';
import 'package:web_site/widgets/categories_section.dart';
import 'package:web_site/widgets/pricing_section.dart';
import 'package:web_site/widgets/footer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شركة المقاولات والعقارات',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: AppColors.text,
          displayColor: AppColors.text,
        ),
      ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            HeroSection(),
            FeaturesSection(),
            CategoriesSection(),
            PricingSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
