import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/service_card_config.dart';
import 'package:web_site/presentation/views/widgets/common/service_card_size_factory.dart';
import 'package:web_site/presentation/views/widgets/common/strategies/service_card_strategy.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';
import 'package:web_site/presentation/views/widgets/graphics/triangle_painter.dart';

/// Strategy implementation for Blog/News Card (Type D)
/// Features: Image, date badge, category badge with triangle, hover effects
class BlogNewsCardStrategy extends ServiceCardStrategy {
  @override
  ServiceCardConfig getConfiguration(BuildContext context) {
    return ServiceCardSizeFactory.getConfig(context);
  }

  @override
  Widget build(
    BuildContext context,
    ServiceCardEntity entity,
    ServiceCardConfig config,
  ) {
    return _BlogNewsCardWidget(
      entity: entity,
      config: config,
    );
  }
}

/// Stateful widget for blog/news card with hover effects
class _BlogNewsCardWidget extends StatefulWidget {
  final ServiceCardEntity entity;
  final ServiceCardConfig config;

  const _BlogNewsCardWidget({
    required this.entity,
    required this.config,
  });

  @override
  State<_BlogNewsCardWidget> createState() => _BlogNewsCardWidgetState();
}

class _BlogNewsCardWidgetState extends State<_BlogNewsCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final config = widget.config;
    final entity = widget.entity;

    // Calculate scaled dimensions
    final cardWidth = 300.0 * config.scaleFactor;
    final imageHeight = 150.0 * config.scaleFactor;
    final categoryBadgeWidth = 135.0 * config.scaleFactor;
    final categoryBadgeHeight = 25.0 * config.scaleFactor;

    return GestureDetector(
      onTap: entity.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Background decoration (hover effect)
            Positioned(
              bottom: _isHovered ? -6 * config.scaleFactor : -3 * config.scaleFactor,
              left: 1,
              right: 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: 30 * config.scaleFactor,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(15 * config.scaleFactor),
                ),
              ),
            ),

            // Main Card
            ClipPath(
              clipper: TopCornerClipper(
                clipSize: 70 * config.scaleFactor,
                topRadius: 8,
                sideRadius: 8,
                isRight: true,
              ),
              child: Container(
                width: cardWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20 * config.scaleFactor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20 * config.scaleFactor,
                      offset: Offset(0, 5 * config.scaleFactor),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageSection(config, entity, imageHeight),
                    SizedBox(height: 20 * config.scaleFactor),
                    _buildContentSection(config, entity),
                  ],
                ),
              ),
            ),

            // Category Badge
            Positioned(
              right: -5,
              top: 135 * config.scaleFactor,
              child: Container(
                alignment: Alignment.center,
                width: categoryBadgeWidth,
                height: categoryBadgeHeight,
                decoration: BoxDecoration(
                  color: const Color(0xFF01165a),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16 * config.scaleFactor),
                    bottomLeft: Radius.circular(16 * config.scaleFactor),
                  ),
                ),
                child: Text(
                  entity.category ?? 'إدارة المشاريع',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12 * config.scaleFactor,
                  ),
                ),
              ),
            ),

            // Triangle decoration below category badge
            Positioned(
              top: 160 * config.scaleFactor,
              right: -5,
              child: CustomPaint(
                size: Size(8 * config.scaleFactor, 8 * config.scaleFactor),
                painter: TrianglePainter(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(ServiceCardConfig config, ServiceCardEntity entity, double imageHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(18 * config.scaleFactor),
      ),
      child: Container(
        height: imageHeight,
        width: double.infinity,
        color: const Color(0xFFE5E7EB),
        child: entity.image != null
            ? Image.asset(
                entity.image!,
                fit: BoxFit.cover,
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildContentSection(ServiceCardConfig config, ServiceCardEntity entity) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        25 * config.scaleFactor,
        0,
        25 * config.scaleFactor,
        25 * config.scaleFactor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date row
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                color: AppColors.primary,
                size: 12 * config.scaleFactor,
              ),
              SizedBox(width: 5 * config.scaleFactor),
              Text(
                entity.date ?? 'نوفمبر 7, 2025',
                style: TextStyle(
                  fontSize: 12 * config.scaleFactor,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          SizedBox(height: 10 * config.scaleFactor),

          // Title
          Text(
            entity.title,
            style: TextStyle(
              color: const Color(0xFF0A1E4D),
              fontSize: 14 * config.scaleFactor,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          SizedBox(height: 12 * config.scaleFactor),

          // Description
          Text(
            entity.description,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: 12 * config.scaleFactor,
              height: 1.6,
            ),
          ),
          SizedBox(height: 20 * config.scaleFactor),

          // Learn More link
          Row(
            children: [
              Text(
                'إعرف المزيد',
                style: TextStyle(
                  color: entity.isHighlighted
                      ? AppColors.primary
                      : const Color(0xFF0A1E4D),
                  fontSize: 12 * config.scaleFactor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8 * config.scaleFactor),
              Icon(
                Icons.arrow_forward,
                color: entity.isHighlighted
                    ? AppColors.primary
                    : const Color(0xFF0A1E4D),
                size: 18 * config.scaleFactor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
