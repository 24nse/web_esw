import 'package:flutter/material.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/universal_service_card.dart';

/// Example usage of UniversalServiceCard with all three card types
/// 
/// This file demonstrates how to use the refactored service card system.
/// You can copy these examples to replace existing card implementations.
class ServiceCardExamples extends StatelessWidget {
  const ServiceCardExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Service Card Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Type A: Marketing Card',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildMarketingCardExample(),
            const SizedBox(height: 40),
            
            const Text(
              'Type B: Team Member Card',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTeamMemberCardExample(),
            const SizedBox(height: 40),
            
            const Text(
              'Type C: Simple Card',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSimpleCardExample(),
            const SizedBox(height: 40),
            
            const Text(
              'Horizontal Scrolling List (maintains scroll behavior)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildHorizontalScrollExample(),
          ],
        ),
      ),
    );
  }

  /// Example: Marketing Service Card (Type A)
  Widget _buildMarketingCardExample() {
    return SizedBox(
      width: 300,
      child: UniversalServiceCard(
        entity: ServiceCardEntity.marketing(
          image: 'assets/images/c.png',
          icon: Icons.villa,
          title: 'بناء وتشييد\nالوحدات السكنية',
          description: 'نقدم خدمات بناء وتشييد الوحدات السكنية بجودة عالية وتصاميم حديثة',
          isHighlighted: true,
          onTap: () {
            debugPrint('Marketing card tapped');
          },
        ),
      ),
    );
  }

  /// Example: Team Member Card (Type B)
  Widget _buildTeamMemberCardExample() {
    return UniversalServiceCard(
      entity: ServiceCardEntity.teamMember(
        image: 'assets/images/eng1.png',
        icon: Icons.person,
        title: 'علي سعيد',
        description: 'مهندس مدني',
        socialLinks: const [
          SocialLink(icon: Icons.facebook, url: 'https://facebook.com'),
          SocialLink(icon: Icons.email, url: 'mailto:ali@example.com'),
          SocialLink(icon: Icons.link, url: 'https://linkedin.com'),
        ],
        onTap: () {
          debugPrint('Team member card tapped');
        },
      ),
    );
  }

  /// Example: Simple Card (Type C)
  Widget _buildSimpleCardExample() {
    return UniversalServiceCard(
      entity: ServiceCardEntity.simple(
        icon: Icons.support_agent,
        title: 'خدمة 24/7',
        subtitle: 'راحتكم أولويتنا',
        phoneNumber: '(000) 000-0000',
      ),
    );
  }

  /// Example: Horizontal scrolling list with cards
  /// This demonstrates that horizontal scrolling behavior is maintained
  Widget _buildHorizontalScrollExample() {
    final cards = [
      ServiceCardEntity.marketing(
        image: 'assets/images/c.png',
        icon: Icons.villa,
        title: 'بناء وتشييد\nالوحدات السكنية',
        description: 'نقدم خدمات بناء وتشييد الوحدات السكنية',
        isHighlighted: true,
      ),
      ServiceCardEntity.marketing(
        image: 'assets/images/p.jpg',
        icon: Icons.business_center,
        title: 'المشاريع\nالتجارية',
        description: 'تصميم وتنفيذ المشاريع التجارية',
      ),
      ServiceCardEntity.marketing(
        image: 'assets/images/p.jpg',
        icon: Icons.construction,
        title: 'التجديدات\nوالتشطيب',
        description: 'خدمات التجديدات والتشطيب الداخلي',
      ),
    ];

    return SizedBox(
      height: 400,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: cards.length,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 300, // Fixed width for horizontal scrolling
            child: UniversalServiceCard(entity: cards[index]),
          );
        },
      ),
    );
  }
}

/// Example: How to replace existing ServiceCard in ServicesSection
/// 
/// BEFORE:
/// ```dart
/// ServiceCard(
///   image: 'assets/images/c.png',
///   icon: Icons.villa,
///   title: 'بناء وتشييد\nالوحدات السكنية',
///   description: 'نقدم خدمات بناء...',
///   isHighlighted: true,
/// )
/// ```
/// 
/// AFTER:
/// ```dart
/// UniversalServiceCard(
///   entity: ServiceCardEntity.marketing(
///     image: 'assets/images/c.png',
///     icon: Icons.villa,
///     title: 'بناء وتشييد\nالوحدات السكنية',
///     description: 'نقدم خدمات بناء...',
///     isHighlighted: true,
///   ),
/// )
/// ```
