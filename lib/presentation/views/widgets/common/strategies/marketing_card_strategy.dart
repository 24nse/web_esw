import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';
import 'package:web_site/presentation/views/widgets/common/service_card_config.dart';
import 'package:web_site/presentation/views/widgets/common/service_card_size_factory.dart';
import 'package:web_site/presentation/views/widgets/common/strategies/service_card_strategy.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';

/// Strategy implementation for Marketing Service Card (Type A)
/// Features: Image, floating icon, hover effects, custom clipper
class MarketingCardStrategy extends ServiceCardStrategy {
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
    return _MarketingCardWidget(
      entity: entity,
      config: config,
    );
  }
}

/// Stateful widget for marketing card with hover effects
class _MarketingCardWidget extends StatefulWidget {
  final ServiceCardEntity entity;
  final ServiceCardConfig config;

  const _MarketingCardWidget({
    required this.entity,
    required this.config,
  });

  @override
  State<_MarketingCardWidget> createState() => _MarketingCardWidgetState();
}

class _MarketingCardWidgetState extends State<_MarketingCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final config = widget.config;
    final entity = widget.entity;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: entity.onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Background decoration (hover effect)
            Positioned(
              bottom: _isHovered
                  ? config.hoverBackgroundBottomHovered
                  : config.hoverBackgroundBottomNormal,
              left: 5,
              right: 5,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: config.hoverBackgroundHeight,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(config.hoverBackgroundRadius),
                ),
              ),
            ),

            // Main Card with Clipper
            ClipPath(
              clipper: TopCornerClipper(
                clipSize: config.topCornerClipSize,
                topRadius: config.clipperTopRadius,
                sideRadius: config.clipperSideRadius,
                isRight: true,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(config.borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(config.shadowOpacity),
                      blurRadius: config.shadowBlurRadius,
                      offset: config.shadowOffset,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageSection(config, entity),
                    SizedBox(height: config.verticalSpacing),
                    _buildContentSection(config, entity),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(ServiceCardConfig config, ServiceCardEntity entity) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Service Image
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(config.borderRadius * 0.9),
          ),
          child: AspectRatio(
            aspectRatio: config.imageAspectRatio,
            child: Container(
              color: const Color(0xFFE5E7EB),
              child: entity.image != null
                  ? Image.asset(entity.image!, fit: BoxFit.cover)
                  : const SizedBox.shrink(),
            ),
          ),
        ),

        // Floating Icon
        Positioned(
          right: config.iconRightPosition,
          bottom: config.iconBottomOffset,
          child: Container(
            width: config.iconContainerSize,
            height: config.iconContainerSize,
            decoration: BoxDecoration(
              color: const Color(0xFF0A1E4D),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: config.iconBorderWidth,
              ),
            ),
            child: FittedBox(
              child: Padding(
                padding: EdgeInsets.all(config.iconSize * 0.5),
                child: Icon(
                  entity.icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentSection(ServiceCardConfig config, ServiceCardEntity entity) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        config.contentPadding,
        0,
        config.contentPadding,
        config.contentPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            entity.title,
            useFittedBox: true,
            alignment: Alignment.centerRight,
            style: TextStyle(
              color: const Color(0xFF0A1E4D),
              fontSize: config.titleFontSize,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          SizedBox(height: config.titleDescriptionSpacing),
          AppText(
            entity.description,
            useFittedBox: true,
            alignment: Alignment.centerRight,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: config.descriptionFontSize,
              height: 1.5,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: config.descriptionLearnMoreSpacing),
          Row(
            children: [
              AppText(
                'إعرف المزيد',
                useFittedBox: true,
                style: TextStyle(
                  color: entity.isHighlighted
                      ? AppColors.primary
                      : const Color(0xFF0A1E4D),
                  fontSize: config.learnMoreFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: config.learnMoreIconSpacing),
              Icon(
                Icons.arrow_forward,
                color: entity.isHighlighted
                    ? AppColors.primary
                    : const Color(0xFF0A1E4D),
                size: config.learnMoreIconSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
