import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/strategies/blog_news_card_strategy.dart';
import 'package:web_site/presentation/views/widgets/common/strategies/marketing_card_strategy.dart';
import 'package:web_site/presentation/views/widgets/common/strategies/service_card_strategy.dart';
import 'package:web_site/presentation/views/widgets/common/strategies/simple_card_strategy.dart';
import 'package:web_site/presentation/views/widgets/common/strategies/team_member_card_strategy.dart';

/// Factory class that returns the appropriate strategy based on card type
/// This follows the Factory Pattern and enables easy extension with new card types
class ServiceCardStrategyFactory {
  /// Returns the appropriate strategy for the given card type
  /// 
  /// This method demonstrates the Open/Closed Principle:
  /// - Open for extension: Add new card types by creating new strategies
  /// - Closed for modification: Existing strategies remain unchanged
  static ServiceCardStrategy getStrategy(ServiceCardType type) {
    switch (type) {
      case ServiceCardType.marketing:
        return MarketingCardStrategy();
      case ServiceCardType.teamMember:
        return TeamMemberCardStrategy();
      case ServiceCardType.simple:
        return SimpleCardStrategy();
      case ServiceCardType.blogNews:
        return BlogNewsCardStrategy();
    }
  }

  /// Alternative method that takes an entity directly
  static ServiceCardStrategy getStrategyFromEntity(ServiceCardEntity entity) {
    return getStrategy(entity.type);
  }
}
