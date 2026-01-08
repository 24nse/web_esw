import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/service_card_config.dart';
import 'package:web_site/presentation/views/widgets/common/service_card_size_factory.dart';
import 'package:web_site/presentation/views/widgets/common/strategies/service_card_strategy.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';
import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';

/// Strategy implementation for Team Member Card (Type B)
/// Features: Split background, ruler ticks painter, social icons, fixed width
class TeamMemberCardStrategy extends ServiceCardStrategy {
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
    return _TeamMemberCardWidget(
      entity: entity,
      config: config,
    );
  }
}

/// Stateful widget for team member card with hover effects
class _TeamMemberCardWidget extends StatefulWidget {
  final ServiceCardEntity entity;
  final ServiceCardConfig config;

  const _TeamMemberCardWidget({
    required this.entity,
    required this.config,
  });

  @override
  State<_TeamMemberCardWidget> createState() => _TeamMemberCardWidgetState();
}

class _TeamMemberCardWidgetState extends State<_TeamMemberCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final config = widget.config;
    final entity = widget.entity;
    
    // Calculate scaled dimensions based on config scale factor
    final cardWidth = 250.0 * config.scaleFactor;
    final imageHeight = 200.0 * config.scaleFactor;
    final personImageWidth = 220.0 * config.scaleFactor;
    final personImageHeight = 320.0 * config.scaleFactor;

    return GestureDetector(
      onTap: entity.onTap,
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
                  _buildImageSection(config, entity, imageHeight, personImageWidth, personImageHeight),
                  _buildContentSection(config, entity),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(
    ServiceCardConfig config,
    ServiceCardEntity entity,
    double imageHeight,
    double personImageWidth,
    double personImageHeight,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(18 * config.scaleFactor),
      ),
      child: CustomPaint(
        foregroundPainter: UnifiedRulerTicksPainter(
          isVertical: true,
          // Top section: diagonal
          drawTop: true,
          topMode: UnifiedRulerTicksMode.diagonal,
          topStep: 12,
          topPatternHeights: const [12],
          topMargin: 0,
          topStrokeWidth: 0.5,
          topColor: const Color(0xFF5F83C8),
          topAngleDeg: 60,
          topDirection: DiagonalDirection.downRight,
          // Bottom section: horizontal
          drawBottom: true,
          bottomMode: UnifiedRulerTicksMode.horizontal,
          bottomStep: 10,
          bottomPatternHeights: const [14, 6, 10, 6, 14],
          bottomMargin: 0,
          bottomStrokeWidth: 0.5,
          bottomColor: const Color(0xFFD1D5DB),
        ),
        child: Container(
          height: imageHeight,
          width: double.infinity,
          color: const Color(0xFFE5E7EB),
          child: Stack(
            children: [
              // Split background
              Positioned.fill(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(color: AppColors.bgG),
                    ),
                    Expanded(
                      child: Container(color: const Color(0xFF01165a)),
                    ),
                  ],
                ),
              ),
              // Person image
              if (entity.image != null)
                Positioned(
                  bottom: -100 * config.scaleFactor,
                  left: 17 * config.scaleFactor,
                  child: SizedBox(
                    width: personImageWidth,
                    height: personImageHeight,
                    child: Image.asset(entity.image!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentSection(ServiceCardConfig config, ServiceCardEntity entity) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        25 * config.scaleFactor,
        10 * config.scaleFactor,
        25 * config.scaleFactor,
        10 * config.scaleFactor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entity.title,
            style: TextStyle(
              color: const Color(0xFF0A1E4D),
              fontSize: 14 * config.scaleFactor,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          SizedBox(height: 5 * config.scaleFactor),
          Text(
            entity.description,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: 10 * config.scaleFactor,
              height: 1.6,
            ),
          ),
          SizedBox(height: 5 * config.scaleFactor),
          _buildSocialIcons(config, entity),
        ],
      ),
    );
  }

  Widget _buildSocialIcons(ServiceCardConfig config, ServiceCardEntity entity) {
    final socialLinks = entity.socialLinks ?? _getDefaultSocialLinks();
    
    return Row(
      children: socialLinks.map((link) {
        return Padding(
          padding: EdgeInsets.only(right: 5 * config.scaleFactor),
          child: Container(
            padding: EdgeInsets.all(4 * config.scaleFactor),
            decoration: const BoxDecoration(
              color: AppColors.gray,
              shape: BoxShape.circle,
            ),
            child: Icon(
              link.icon,
              color: Colors.white,
              size: 12 * config.scaleFactor,
            ),
          ),
        );
      }).toList(),
    );
  }

  List<SocialLink> _getDefaultSocialLinks() {
    return const [
      SocialLink(icon: Icons.facebook, url: ''),
      SocialLink(icon: Icons.email, url: ''),
      SocialLink(icon: Icons.link, url: ''),
    ];
  }
}
