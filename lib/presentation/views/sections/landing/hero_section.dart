
import 'package:flutter/material.dart';
import 'package:web_site/common/utils/responsive_helper.dart';
import 'package:web_site/presentation/views/widgets/animations/animated_service_button.dart';
import 'package:web_site/presentation/views/widgets/graphics/bottom_diagonal_painter.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';
import 'package:web_site/presentation/views/widgets/layout/container_circle_header.dart';
import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';
import 'package:web_site/presentation/views/widgets/decorations/decorative_stars.dart';
import 'package:web_site/presentation/views/widgets/graphics/diagonal_lines_painter.dart';
import 'package:web_site/presentation/views/widgets/buttons/play_button.dart';
import 'package:web_site/presentation/views/widgets/animations/rotating_contact_circle.dart';
import 'package:web_site/presentation/views/widgets/common/stats_card.dart';



class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _fadeController;
  late AnimationController _scaleController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // دوران دائرة "تواصل معنا"
    _rotationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    // Fade in animation
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    // Scale animation
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );

    _fadeController.forward();
    _scaleController.forward();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomPaint(
        foregroundPainter: UnifiedRulerTicksPainter(
          drawTop: true,
          topMode: UnifiedRulerTicksMode.horizontal,
          topStep: 10,
          topPatternHeights: const [14, 6, 10, 6, 14],
          topMargin: 0,
          topStrokeWidth: 1,
          topColor: const Color(0xFFD1D5DB),
          drawBottom: true,
          bottomMode: UnifiedRulerTicksMode.diagonal,
          bottomStep: 12,
          bottomPatternHeights: const [20],
          bottomMargin: 0,
          bottomStrokeWidth: 1,
          bottomColor: const Color(0xFF5F83C8),
          bottomAngleDeg: 60,
          bottomDirection: DiagonalDirection.downLeft,
        ),
        child: Container(
          height: isMobile ? 850 : (isTablet ? 750 : 650),
          color: const Color(0xFFf2f4f5),
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTopSection(),
                    const SizedBox(height: 30),
                    _buildBottomSection(),
                  ],
                ),
              ),
              // Image and Stats Cards
              _buildFloatingCards(context),
              
              // Decorative Stars
              if (!isMobile)
                Positioned(
                  top: isTablet ? 500 : 450,
                  right: isTablet ? 40 : 140,
                  child: const DecorativeStars(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingCards(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    if (isMobile) {
      return Positioned(
        top: 420,
        left: 20,
        right: 20,
        child: Column(
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: _buildImageCard(width: double.infinity, height: 200),
            ),
            const SizedBox(height: 20),
            ScaleTransition(
              scale: _scaleAnimation,
              child: const StatsCard(),
            ),
          ],
        ),
      );
    }

    return Positioned(
      top: isTablet ? 320 : 260,
      right: isTablet ? 40 : 140,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: _buildImageCard(
                width: isTablet ? 400 : 700,
                height: 250,
              ),
            ),
            const SizedBox(width: 40),
            ScaleTransition(
              scale: _scaleAnimation,
              child: const StatsCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 90),
        vertical: isMobile ? 30 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Row(
                        children: [
                          Container(
                            width: 4,
                            height: 24,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF6B2C),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'التميز في البناء الحائز على الجوائز',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: isMobile ? 14 : 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'حيث يقود الابتكار إلى',
                            style: TextStyle(
                              fontSize: isMobile ? 28 : (isTablet ? 36 : 44),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF001F5C),
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Color(0xFFFF6B2C), Color(0xFFFF8A5C)],
                            ).createShader(bounds),
                            child: Text(
                              'الكمال الإنشائي',
                              style: TextStyle(
                                fontSize: isMobile ? 28 : (isTablet ? 36 : 44),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                ContainerCircleHeader(controller: _rotationController),
            ],
          ),
          const SizedBox(height: 30),
          ScaleTransition(
            scale: _scaleAnimation,
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildServiceButton('خدمات البناء'),
                          _buildServiceButton('أعمال الخرسانة'),
                          _buildServiceButton('التصميم'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'نحن نقدم حلولاً متكاملة في مجال المقاولات والعقارات مع التزام كامل بالجودة والابتكار لتحقيق رؤيتكم الإنشائية بأعلى المعايير العالمية',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 13,
                          height: 1.6,
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            _buildServiceButton('خدمات البناء العامة'),
                            _buildServiceButton('أعمال الخرسانة'),
                            _buildServiceButton('التصميم والتخطيط'),
                            _buildServiceButton('الأعمال المدنية'),
                            _buildServiceButton('ما قبل البناء'),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 2,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFFFF6B2C).withOpacity(0.2),
                              const Color(0xFFFF6B2C),
                              const Color(0xFFFF6B2C).withOpacity(0.2),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'نحن نقدم حلولاً متكاملة في مجال المقاولات والعقارات مع التزام كامل بالجودة والابتكار لتحقيق رؤيتكم الإنشائية بأعلى المعايير العالمية',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: isTablet ? 14 : 15,
                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceButton(String text) {
    return AnimatedServiceButton(text: text);
  }

  Widget _buildBottomSection() {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 90),
        vertical: isMobile ? 30 : 60,
      ),
      height: isMobile ? 150 : 200,
      decoration: const BoxDecoration(
        color: Color(0xFF001F5C),
        image: DecorationImage(
          image: AssetImage('assets/images/c.png'),
          fit: BoxFit.cover,
          opacity: 0.05,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: DiagonalLinesPainter(),
            ),
          ),
          if (!isMobile)
            Positioned(
              bottom: isTablet ? 60 : 75,
              left: 20,
              child: RotatingContactCircle(controller: _rotationController),
            ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CustomPaint(
              size: Size(isMobile ? 150 : 300, isMobile ? 60 : 120),
              painter: BottomDiagonalPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard({double width = 700, double height = 250}) {
    return ClipPath(
      clipper: TopCornerClipper(
        clipSize: 70,
        topRadius: 8,
        sideRadius: 8,
        isRight: true,
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey[300]!,
                      Colors.grey[400]!,
                      Colors.grey[500]!,
                    ],
                  ),
                ),
                child: Image.asset(
                  "assets/images/c.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Center(
                child: PlayButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







