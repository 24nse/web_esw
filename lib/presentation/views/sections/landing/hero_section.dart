
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

// Enum for layout IDs
enum HeroLayoutId {
  topSection,
  bottomSection,
  floatingCards,
  decorativeStars,
}

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = ResponsiveHelper.isMobile(context);
          final isTablet = ResponsiveHelper.isTablet(context);
          final availableWidth = constraints.maxWidth;
          final availableHeight = constraints.maxHeight;
          
          // Calculate responsive height based on screen size
          final containerHeight = isMobile 
              ? (availableHeight > 850 ? 850.0 * 0.77 : availableHeight.clamp(600.0, 850.0))
              : (isTablet 
                  ? (availableHeight > 750 ? 750.0 : availableHeight.clamp(600.0, 750.0))
                  : (availableHeight > 650 ? 650.0 : availableHeight.clamp(550.0, 650.0)));

          return CustomPaint(
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
              height: containerHeight,
              width: availableWidth,
              color: const Color(0xFFf2f4f5),
              child: CustomMultiChildLayout(
                delegate: HeroLayoutDelegate(
                  isMobile: isMobile,
                  isTablet: isTablet,
                  containerHeight: containerHeight,
                  availableWidth: availableWidth,
                ),
                children: [
                  // Top Section
                  LayoutId(
                    id: HeroLayoutId.topSection,
                    child: _buildTopSection(),
                  ),
                  // Bottom Section
                  LayoutId(
                    id: HeroLayoutId.bottomSection,
                    child: _buildBottomSection(),
                  ),
                  // Floating Cards (Image + Stats)

                    LayoutId(
                      id: HeroLayoutId.floatingCards,
                      child: _buildFloatingCardsContent(context),
                    ),
                  // Decorative Stars

                    // LayoutId(
                    //   id: HeroLayoutId.decorativeStars,
                    //   child: const DecorativeStars(),
                    // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFloatingCards(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);
        final isTablet = ResponsiveHelper.isTablet(context);
        final availableWidth = constraints.maxWidth;
        final availableHeight = constraints.maxHeight;

        // Calculate responsive positions and sizes
        final topPosition = isTablet 
            ? availableHeight * 0.43 
            : availableHeight * 0.40;
        final rightPosition = isTablet ? 40.0 : availableWidth * 0.1;
        
        // Calculate image card dimensions responsively
        final imageCardWidth = isTablet 
            ? (availableWidth * 0.5).clamp(300.0, 400.0)
            : (availableWidth * 0.5).clamp(400.0, 700.0);
        final imageCardHeight = (imageCardWidth * 0.36).clamp(180.0, 250.0);

        if (isMobile) {
          // On mobile, don't show floating cards to prevent overflow
          return const SizedBox.shrink();
        }

        return Positioned(
          top: topPosition,
          right: rightPosition,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: availableWidth * 0.8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 7,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: _buildImageCard(
                      width: imageCardWidth,
                      height: imageCardHeight,
                    ),
                  ),
                ),
                SizedBox(width: isTablet ? 20 : 40),
                Flexible(
                  flex: 3,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: const StatsCard(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // New method for CustomMultiChildLayout - returns content without Positioned wrapper
  Widget _buildFloatingCardsContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);
        final isTablet = ResponsiveHelper.isTablet(context);
        final availableWidth = MediaQuery.of(context).size.width;

        // Calculate image card dimensions responsively
        final imageCardWidth = isTablet 
            ? (availableWidth * 0.5).clamp(300.0, 400.0)
            : (availableWidth * 0.5).clamp(400.0, 700.0);
        final imageCardHeight = (imageCardWidth * 0.36).clamp(180.0, 250.0);

        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: availableWidth * 0.8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 7,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: _buildImageCard(
                    width: imageCardWidth,
                    height: imageCardHeight,
                  ),
                ),
              ),
              SizedBox(width: isTablet ? 20 : 40),
              Flexible(
                flex: 3,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: const StatsCard(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);
        final isTablet = ResponsiveHelper.isTablet(context);
        final availableWidth = constraints.maxWidth;

        // Calculate responsive padding
        final horizontalPadding = isMobile 
            ? 20.0 
            : (isTablet ? 40.0 : availableWidth * 0.065);
        final verticalPadding = isMobile ? 30.0 : 60.0;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: isMobile ? 20 : 24,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF6B2C),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'التميز في البناء الحائز على الجوائز',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: isMobile ? 16 : 20),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'حيث يقود الابتكار إلى',
                                  style: TextStyle(
                                    fontSize: isMobile ? 28 : (isTablet ? 36 : 44),
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF001F5C),
                                    height: 1.2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerRight,
                                child: ShaderMask(
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isMobile) ...[
                    SizedBox(width: isTablet ? 20 : 40),
                    ContainerCircleHeader(controller: _rotationController),
                  ],
                ],
              ),
              SizedBox(height: isMobile ? 20 : 30),
              ScaleTransition(
                scale: _scaleAnimation,
                child: isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _buildServiceButton('خدمات البناء'),
                                _buildServiceButton('أعمال الخرسانة'),
                                _buildServiceButton('التصميم'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Text(
                              'نحن نقدم حلولاً متكاملة في مجال المقاولات والعقارات مع التزام كامل بالجودة والابتكار لتحقيق رؤيتكم الإنشائية بأعلى المعايير العالمية',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 13,
                                height: 1.6,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Flexible(
                            flex: 0,
                            child: Container(
                              height: 50,
                              width: 2,
                              margin: EdgeInsets.symmetric(
                                horizontal: isTablet ? 16 : 24,
                              ),
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
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServiceButton(String text) {
    return AnimatedServiceButton(text: text);
  }

  Widget _buildBottomSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);
        final isTablet = ResponsiveHelper.isTablet(context);
        final availableWidth = constraints.maxWidth;

        // Calculate responsive padding and height
        final horizontalPadding = isMobile 
            ? 20.0 
            : (isTablet ? 40.0 : availableWidth * 0.065);
        final verticalPadding = isMobile ? 30.0 : 60.0;
        final containerHeight = isMobile ? 150.0 : 200.0;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          height: containerHeight,
          width: availableWidth,
          decoration: const BoxDecoration(
            color: Color(0xFF001F5C),
            image: DecorationImage(
              image: AssetImage('assets/images/c.png'),
              fit: BoxFit.cover,
              opacity: 0.05,
            ),
          ),
          child: CustomMultiChildLayout(
            delegate: BottomSectionLayoutDelegate(
              isMobile: isMobile,
              isTablet: isTablet,
              containerWidth: availableWidth,
              containerHeight: containerHeight,
            ),
            children: [
              // Background diagonal lines
              LayoutId(
                id: BottomSectionLayoutId.diagonalLines,
                child: CustomPaint(
                  painter: DiagonalLinesPainter(),
                ),
              ),
              // Rotating contact circle
              if (!isMobile)
                LayoutId(
                  id: BottomSectionLayoutId.rotatingCircle,
                  child: RotatingContactCircle(controller: _rotationController),
                ),
              // Bottom diagonal painter
              LayoutId(
                id: BottomSectionLayoutId.bottomDiagonal,
                child: CustomPaint(
                  size: Size(
                    isMobile ? 150 : (isTablet ? 200 : 300),
                    isMobile ? 60 : (isTablet ? 80 : 120),
                  ),
                  painter: BottomDiagonalPainter(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageCard({double width = 700, double height = 250}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Ensure the card fits within available space
        final cardWidth = width.clamp(200.0, constraints.maxWidth);
        final cardHeight = height.clamp(150.0, constraints.maxHeight);

        return ClipPath(
          clipper: TopCornerClipper(
            clipSize: 70,
            topRadius: 8,
            sideRadius: 8,
            isRight: true,
          ),
          child: Container(
            height: cardHeight,
            width: cardWidth,
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
      },
    );
  }
}

// Custom Layout Delegate for Hero Section
class HeroLayoutDelegate extends MultiChildLayoutDelegate {
  final bool isMobile;
  final bool isTablet;
  final double containerHeight;
  final double availableWidth;

  HeroLayoutDelegate({
    required this.isMobile,
    required this.isTablet,
    required this.containerHeight,
    required this.availableWidth,
  });

  @override
  void performLayout(Size size) {
    final hasTopSection = hasChild(HeroLayoutId.topSection);
    final hasBottomSection = hasChild(HeroLayoutId.bottomSection);
    final hasFloatingCards = hasChild(HeroLayoutId.floatingCards);
    final hasDecorativeStars = hasChild(HeroLayoutId.decorativeStars);

    // Calculate section heights based on device type
    // Bottom section: Fixed at 30% for all devices
    // Top section: 45% on mobile (compact, no wasted space), 70% on tablet/desktop
    final topSectionHeight = isMobile ? size.height * 0.45 : size.height * 0.7;
    final bottomSectionHeight = size.height * 0.3;  // Fixed 30% for all devices

    // Layout Top Section
    if (hasTopSection) {
      final topSize = layoutChild(
        HeroLayoutId.topSection,
        BoxConstraints(
          maxWidth: size.width,
          maxHeight: topSectionHeight,
        ),
      );
      positionChild(HeroLayoutId.topSection, Offset.zero);
    }

    // Layout Bottom Section
    if (hasBottomSection) {
      final bottomSize = layoutChild(
        HeroLayoutId.bottomSection,
        BoxConstraints(
          maxWidth: size.width,
          maxHeight: bottomSectionHeight,
        ),
      );
      positionChild(
        HeroLayoutId.bottomSection,
        Offset(0, size.height - bottomSize.height),
      );
    }

    // Layout Floating Cards - Vertically centered between top and bottom sections
    if (hasFloatingCards) {
      // First, layout the child to get its size
      final cardsSize = layoutChild(
        HeroLayoutId.floatingCards,
        BoxConstraints(
          maxWidth: isMobile ? size.width * 0.9 : size.width * 0.8,
          maxHeight: size.height * 0.4,
        ),
      );
      
      // Calculate the vertical center position between top and bottom sections
      // Top section ends at topSectionHeight
      // Bottom section starts at (size.height - bottomSectionHeight)
      // Available middle space = (size.height - bottomSectionHeight) - topSectionHeight
      final middleSpaceStart = topSectionHeight;
      final middleSpaceEnd = size.height - bottomSectionHeight;
      final middleSpaceHeight = middleSpaceEnd - middleSpaceStart;
      
      // Center the cards vertically in the middle space
      // This formula centers the widget perfectly between top and bottom sections
      final verticalCenter = middleSpaceStart + (middleSpaceHeight - cardsSize.height) / 2;
      
      // Calculate horizontal position (from right edge)
      final rightPosition = isMobile 
          ? 20.0  // Smaller margin on mobile to fit content
          : (isTablet ? 40.0 : availableWidth * 0.1);
      
      positionChild(
        HeroLayoutId.floatingCards,
        Offset(size.width - cardsSize.width - rightPosition, verticalCenter),
      );
    }

    // Layout Decorative Stars - Consistent position across all screen sizes
    if (hasDecorativeStars) {
      // Use consistent positioning regardless of screen size
      // Position at 69% from top, 10% from right edge
      final starsTopPosition = containerHeight * 0.69;
      final starsRightPosition = isMobile 
          ? 20.0  // Smaller margin on mobile
          : (isTablet ? 40.0 : availableWidth * 0.1);

      final starsSize = layoutChild(
        HeroLayoutId.decorativeStars,
        BoxConstraints.loose(Size(100, 100)),
      );
      
      positionChild(
        HeroLayoutId.decorativeStars,
        Offset(size.width - starsSize.width - starsRightPosition, starsTopPosition),
      );
    }
  }

  @override
  bool shouldRelayout(covariant HeroLayoutDelegate oldDelegate) {
    return oldDelegate.isMobile != isMobile ||
        oldDelegate.isTablet != isTablet ||
        oldDelegate.containerHeight != containerHeight ||
        oldDelegate.availableWidth != availableWidth;
  }
}

// Enum for bottom section layout IDs
enum BottomSectionLayoutId {
  diagonalLines,
  rotatingCircle,
  bottomDiagonal,
}

// Custom Layout Delegate for Bottom Section
class BottomSectionLayoutDelegate extends MultiChildLayoutDelegate {
  final bool isMobile;
  final bool isTablet;
  final double containerWidth;
  final double containerHeight;

  BottomSectionLayoutDelegate({
    required this.isMobile,
    required this.isTablet,
    required this.containerWidth,
    required this.containerHeight,
  });

  @override
  void performLayout(Size size) {
    final hasDiagonalLines = hasChild(BottomSectionLayoutId.diagonalLines);
    final hasRotatingCircle = hasChild(BottomSectionLayoutId.rotatingCircle);
    final hasBottomDiagonal = hasChild(BottomSectionLayoutId.bottomDiagonal);

    // Layout diagonal lines background (fills entire container)
    if (hasDiagonalLines) {
      layoutChild(
        BottomSectionLayoutId.diagonalLines,
        BoxConstraints.tight(size),
      );
      positionChild(BottomSectionLayoutId.diagonalLines, Offset.zero);
    }

    // Layout rotating contact circle
    if (hasRotatingCircle) {
      final circleSize = layoutChild(
        BottomSectionLayoutId.rotatingCircle,
        BoxConstraints.loose(Size(200, 200)),
      );
      
      final bottomPosition = isTablet ? 60.0 : 75.0;
      positionChild(
        BottomSectionLayoutId.rotatingCircle,
        Offset(20, size.height - circleSize.height - bottomPosition),
      );
    }

    // Layout bottom diagonal painter
    if (hasBottomDiagonal) {
      final diagonalSize = layoutChild(
        BottomSectionLayoutId.bottomDiagonal,
        BoxConstraints.loose(
          Size(
            isMobile ? 150 : (isTablet ? 200 : 300),
            isMobile ? 60 : (isTablet ? 80 : 120),
          ),
        ),
      );
      
      positionChild(
        BottomSectionLayoutId.bottomDiagonal,
        Offset(size.width - diagonalSize.width, size.height - diagonalSize.height),
      );
    }
  }

  @override
  bool shouldRelayout(covariant BottomSectionLayoutDelegate oldDelegate) {
    return oldDelegate.isMobile != isMobile ||
        oldDelegate.isTablet != isTablet ||
        oldDelegate.containerWidth != containerWidth ||
        oldDelegate.containerHeight != containerHeight;
  }
}

