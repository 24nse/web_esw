import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../helpers/animated_service_button.dart';
import '../helpers/bottom_diagonal_painter.dart';
import '../helpers/clippers.dart';
import '../helpers/container_circle_header.dart';
import '../helpers/custom_painter/unified_ruler_ticks_painter.dart';
import '../helpers/decorative_stars.dart';
import '../helpers/diagonal_lines_painter.dart';
import '../helpers/play_button.dart';
import '../helpers/rotating_contact_circle.dart';
import '../helpers/stats_card.dart';



class HeroSection extends StatefulWidget {
  const HeroSection({Key? key}) : super(key: key);

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child:  CustomPaint(
        foregroundPainter: UnifiedRulerTicksPainter(

          // أعلى أفقي
          drawTop: true,
          topMode: UnifiedRulerTicksMode.horizontal,
          topStep: 10,
          topPatternHeights: const [14, 6, 10, 6, 14],
          topMargin: 0,
          topStrokeWidth: 1,
          topColor: Color(0xFFD1D5DB),

          // الجزء السفلي فقط مائل
          drawBottom: true,
          bottomMode: UnifiedRulerTicksMode.diagonal,
          bottomStep: 12,
          bottomPatternHeights: const [20], // كل العلامات نفس الطول (مستمر)
          bottomMargin: 0,
          bottomStrokeWidth: 1,
          bottomColor: Color(0xFF5F83C8),
          bottomAngleDeg: 60,
          bottomDirection: DiagonalDirection.downLeft,
        ),


        child: Container(
          height: 650,
          color: Color(0xFFf2f4f5),
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // القسم العلوي - أبيض
                    _buildTopSection(),
                    // القسم السفلي - أزرق
                    SizedBox(height: 30,),
                    _buildBottomSection(),
                  ],
                ),
              ),
              Positioned(
                top: 260,
                right: 140,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // النجوم الزخرفية
                      // const DecorativeStars(),
                      // const SizedBox(width: 60),

                      // صورة فريق العمل
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: _buildImageCard(),
                      ),

                      const SizedBox(width: 40),

                      // بطاقة الإحصائيات
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: const StatsCard(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 450,
                right: 140,
                child:  const DecorativeStars(),)
            ],
          ),
        ),
      ),

    );
  }

  Widget  _buildTopSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان صغير مع حد برتقالي
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(

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
                        const Text(
                          'التميز في البناء الحائز على الجوائز',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Cairo"
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // العنوان الرئيسي
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'حيث يقود الابتكار إلى',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF001F5C),
                              height: 1.2,
                              fontFamily: "Cairo"
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
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                                fontFamily: "Cairo"

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              ContainerCircleHeader(controller: _rotationController),
            ],
          ),
          const SizedBox(height: 30),



          // أزرار الخدمات والوصف
          ScaleTransition(
            scale: _scaleAnimation,
            child: Row(

              children: [
                Wrap(
                  spacing: 16,
                  runSpacing: 16,

                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _buildServiceButton('خدمات البناء العامة'),
                    _buildServiceButton('أعمال الخرسانة'),
                    _buildServiceButton('التصميم والتخطيط'),
                    _buildServiceButton('الأعمال المدنية'),
                    _buildServiceButton('ما قبل البناء'),
                  ],
                ),


                // فاصل عمودي
                Container(
                  height: 50,
                  width: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
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

                // النص الوصفي
                SizedBox(
                  width: 450,
                  child: Text(
                    'نحن نقدم حلولاً متكاملة في مجال المقاولات والعقارات مع التزام كامل بالجودة والابتكار لتحقيق رؤيتكم الإنشائية بأعلى المعايير العالمية',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                        height: 1.6,
                        fontFamily: "Cairo"
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 60),

      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF001F5C),
        image: DecorationImage(
          image: const AssetImage('assets/images/c.png'),
          fit: BoxFit.cover,
          opacity: 0.05,

        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // خطوط قطرية في الخلفية
          Positioned.fill(
            child: CustomPaint(
              painter: DiagonalLinesPainter(),
            ),
          ),


          // دائرة "تواصل معنا" الدوارة
          Positioned(
            bottom: 75,
            left: 20,
            child: RotatingContactCircle(controller: _rotationController),
          ),

          // خطوط مائلة في الركن السفلي
          Positioned(
            bottom: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(300, 120),
              painter: BottomDiagonalPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard() {
    return ClipPath(
      clipper: TopCornerClipper(
          clipSize: 70,
          topRadius: 8,
          sideRadius: 8,
          isRight: true
      ),
      child: Container(
        height: 250,
        width: 700,
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
            fit: StackFit.expand, // ✅ تجعل العناصر تملأ كامل المساحة


            children: [
              // صورة الخلفية
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
                child: Image.asset("assets/images/c.png", fit: BoxFit.fill,),
              ),

              Center(
                child: PlayButton(),

              ),
            ],
          ),
        ),
      ),
    );
  }
}






