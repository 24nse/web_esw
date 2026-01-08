import 'package:flutter/material.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/service_card_config.dart';

/// Abstract strategy interface for rendering different service card types
/// This follows the Strategy Pattern and Open/Closed Principle
abstract class ServiceCardStrategy {
  /// Builds the card UI based on the entity and configuration
  Widget build(
    BuildContext context,
    ServiceCardEntity entity,
    ServiceCardConfig config,
  );

  /// Returns the appropriate configuration for this card type
  ServiceCardConfig getConfiguration(BuildContext context);
}
