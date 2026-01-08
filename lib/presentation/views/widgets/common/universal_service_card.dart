import 'package:flutter/material.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/strategies/service_card_strategy_factory.dart';

/// Universal Service Card Widget
/// 
/// This is the main entry point for rendering any type of service card.
/// It uses the Strategy Pattern to delegate rendering to the appropriate strategy
/// based on the card type specified in the entity.
/// 
/// Benefits:
/// - Single Responsibility: This widget only handles delegation
/// - Open/Closed: New card types can be added without modifying this class
/// - Composition over Inheritance: Uses composition with strategies
/// 
/// Usage:
/// ```dart
/// UniversalServiceCard(
///   entity: ServiceCardEntity.marketing(
///     image: 'assets/images/service.png',
///     icon: Icons.villa,
///     title: 'Service Title',
///     description: 'Service description',
///   ),
/// )
/// ```
class UniversalServiceCard extends StatelessWidget {
  final ServiceCardEntity entity;

  const UniversalServiceCard({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    // Get the appropriate strategy based on card type
    final strategy = ServiceCardStrategyFactory.getStrategyFromEntity(entity);
    
    // Get the configuration for this card type
    final config = strategy.getConfiguration(context);
    
    // Delegate rendering to the strategy
    return strategy.build(context, entity, config);
  }
}
