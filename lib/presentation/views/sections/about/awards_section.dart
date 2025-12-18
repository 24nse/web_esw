import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../widgets/common/title_section.dart';

/// Awards section showcasing company achievements and recognitions
/// Design based on the "Our Journey to Award-Winning Success" UI pattern
class AwardsSection extends StatefulWidget {
  const AwardsSection({super.key});

  @override
  State<AwardsSection> createState() => _AwardsSectionState();
}

class _AwardsSectionState extends State<AwardsSection> {
  late ScrollController _scrollController;
  int _currentPage = 0;
  double _cardWidth = 280;
  double _cardSpacing = 20;

  final List<AwardItem> _awards = [
    AwardItem(
      number: '01',
      badgeTitle: 'SAFETY\nEXCELLENCE',
      badgeSubtitle: 'AWARD',
      year: '2025',
      title: 'Safety Excellence Award',
      description: 'جائزة التميز في السلامة المهنية لأعلى معايير الأمان',
    ),
    AwardItem(
      number: '02',
      badgeTitle: 'BEST\nCONTRACTOR',
      badgeSubtitle: 'AWARD',
      year: '2024',
      title: 'Best Contractor Award',
      description: 'جائزة أفضل مقاول لجودة التنفيذ والالتزام بالمواعيد',
    ),
    AwardItem(
      number: '03',
      badgeTitle: 'ZERO\nINCIDENT',
      badgeSubtitle: 'AWARD',
      year: '2023',
      title: 'Zero Incident Award',
      description: 'جائزة صفر حوادث للسجل المثالي في السلامة',
    ),
    AwardItem(
      number: '04',
      badgeTitle: 'TOP\nQUALITY',
      badgeSubtitle: 'AWARD',
      year: '2022',
      title: 'Top Quality Award',
      description: 'جائزة الجودة العالية للتفوق في معايير البناء',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    
    final scrollOffset = _scrollController.offset;
    final itemWidth = _cardWidth + _cardSpacing;
    final newPage = (scrollOffset / itemWidth).round().clamp(0, _awards.length - 1);
    
    if (newPage != _currentPage) {
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  void _scrollToPage(int index) {
    final itemWidth = _cardWidth + _cardSpacing;
    final targetOffset = index * itemWidth;
    
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      decoration: const BoxDecoration(
        color: AppColors.primaryDark,
      ),
      child: Column(
        children: [
          // Header Section
          TitleSection(
            title: 'جوائزنا',
            des1: 'رحلتنا نحو\n',
            des2: 'النجاح والتميز',
            colordse1: Colors.white,
            colordse2: AppColors.primary,
          ),
          const SizedBox(height: 50),
          // Awards Carousel
          _buildAwardsCarousel(),
          const SizedBox(height: 40),
          // Pagination Dots
          _buildPaginationDots(),
        ],
      ),
    );
  }

  /// Builds the horizontal awards carousel
  Widget _buildAwardsCarousel() {
    return SizedBox(
      height: 380,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive card width based on screen size
          if (constraints.maxWidth < 600) {
            _cardWidth = constraints.maxWidth * 0.85;
          } else if (constraints.maxWidth < 900) {
            _cardWidth = constraints.maxWidth * 0.42;
          } else {
            _cardWidth = 280;
          }
          _cardSpacing = 20;

          return ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: (constraints.maxWidth - _cardWidth) / 2,
            ),
            itemCount: _awards.length,
            itemBuilder: (context, index) {
              return _buildAwardCard(_awards[index], index);
            },
          );
        },
      ),
    );
  }

  /// Builds individual award card
  Widget _buildAwardCard(AwardItem award, int index) {
    final isActive = index == _currentPage;

    return GestureDetector(
      onTap: () => _scrollToPage(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        width: _cardWidth,
        margin: EdgeInsets.symmetric(
          horizontal: _cardSpacing / 2,
          vertical: isActive ? 0 : 15,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF0D2555),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.08),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Large background number
              Positioned(
                right: -20,
                top: 20,
                child: Text(
                  award.number,
                  style: TextStyle(
                    fontSize: 180,
                    fontWeight: FontWeight.w900,
                    color: Colors.white.withOpacity(0.03),
                    height: 0.8,
                  ),
                ),
              ),
              // Card content
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badge with laurel wreath
                    _buildAwardBadge(award),
                    const SizedBox(height: 20),
                    // Award Title
                    Text(
                      award.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Description
                    Text(
                      award.description,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.6),
                        height: 1.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the decorative award badge with laurel wreath
  Widget _buildAwardBadge(AwardItem award) {
    return Container(
      width: 140,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Laurel wreath decoration
          CustomPaint(
            size: const Size(140, 160),
            painter: LaurelWreathPainter(),
          ),
          // Center badge content
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Stars
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    size: 12,
                    color: AppColors.primary.withOpacity(0.9),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Badge title
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  award.badgeTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.2,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              // Badge subtitle
              Text(
                award.badgeSubtitle,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.7),
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              // Year
              Text(
                award.year,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds pagination indicator dots
  Widget _buildPaginationDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _awards.length,
        (index) => GestureDetector(
          onTap: () => _scrollToPage(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: index == _currentPage ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: index == _currentPage
                  ? AppColors.primary
                  : Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom painter for laurel wreath decoration
class LaurelWreathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw left branch of laurel
    _drawLaurelBranch(canvas, paint, centerX - 55, centerY, true);
    // Draw right branch of laurel
    _drawLaurelBranch(canvas, paint, centerX + 55, centerY, false);
  }

  void _drawLaurelBranch(
      Canvas canvas, Paint paint, double startX, double centerY, bool isLeft) {
    final leafPaint = Paint()
      ..color = Colors.white.withOpacity(0.12)
      ..style = PaintingStyle.fill;

    final stemPaint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Draw curved stem
    final stemPath = Path();
    if (isLeft) {
      stemPath.moveTo(startX + 20, centerY + 60);
      stemPath.quadraticBezierTo(startX - 5, centerY, startX + 20, centerY - 60);
    } else {
      stemPath.moveTo(startX - 20, centerY + 60);
      stemPath.quadraticBezierTo(startX + 5, centerY, startX - 20, centerY - 60);
    }
    canvas.drawPath(stemPath, stemPaint);

    // Draw leaves along the stem
    for (int i = 0; i < 8; i++) {
      final t = i / 7.0;
      final y = centerY + 50 - (100 * t);
      final xOffset = isLeft ? -10 + (5 * t) : 10 - (5 * t);
      final x = startX + xOffset;

      _drawLeaf(canvas, leafPaint, x, y, isLeft, 12, 6);
    }
  }

  void _drawLeaf(Canvas canvas, Paint paint, double x, double y, bool isLeft,
      double length, double width) {
    final path = Path();
    final direction = isLeft ? -1.0 : 1.0;

    path.moveTo(x, y);
    path.quadraticBezierTo(
      x + (length * 0.5 * direction),
      y - width,
      x + (length * direction),
      y,
    );
    path.quadraticBezierTo(
      x + (length * 0.5 * direction),
      y + width,
      x,
      y,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Model class for award items
class AwardItem {
  final String number;
  final String badgeTitle;
  final String badgeSubtitle;
  final String year;
  final String title;
  final String description;

  const AwardItem({
    required this.number,
    required this.badgeTitle,
    required this.badgeSubtitle,
    required this.year,
    required this.title,
    required this.description,
  });
}
