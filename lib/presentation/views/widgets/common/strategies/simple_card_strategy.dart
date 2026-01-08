import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/service_card_config.dart';
import 'package:web_site/presentation/views/widgets/common/service_card_size_factory.dart';
import 'package:web_site/presentation/views/widgets/common/strategies/service_card_strategy.dart';

/// Strategy implementation for Simple Service Card (Type C)
/// Features: Icon in circle, simple text layout, minimal design for sidebars
class SimpleCardStrategy extends ServiceCardStrategy {
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
    return _SimpleCardWidget(
      entity: entity,
      config: config,
    );
  }
}

/// Stateless widget for simple card
class _SimpleCardWidget extends StatelessWidget {
  final ServiceCardEntity entity;
  final ServiceCardConfig config;

  const _SimpleCardWidget({
    required this.entity,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpaces.lg * config.scaleFactor),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(config.borderRadius),
        boxShadow: AppShadows.card,
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          _buildIcon(config),
          SizedBox(width: AppSpaces.md * config.scaleFactor),
          Expanded(
            child: _buildContent(config),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(ServiceCardConfig config) {
    return Container(
      width: 46 * config.scaleFactor,
      height: 46 * config.scaleFactor,
      decoration: BoxDecoration(
        color: AppColors.bgG,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.border),
      ),
      alignment: Alignment.center,
      child: Icon(
        entity.icon,
        color: AppColors.primary,
        size: 24 * config.scaleFactor,
      ),
    );
  }

  Widget _buildContent(ServiceCardConfig config) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          entity.subtitle ?? entity.description,
          style: TextStyle(
            fontSize: 12 * config.scaleFactor,
            color: AppColors.textMuted,
          ),
        ),
        SizedBox(height: 4 * config.scaleFactor),
        Text(
          entity.title,
          style: TextStyle(
            fontSize: 20 * config.scaleFactor,
            fontWeight: FontWeight.w800,
            color: AppColors.text,
          ),
        ),
        if (entity.phoneNumber != null) ...[
          SizedBox(height: 4 * config.scaleFactor),
          Text(
            entity.phoneNumber!,
            style: TextStyle(
              fontSize: 14 * config.scaleFactor,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ],
    );
  }
}
