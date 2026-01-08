import 'package:flutter/material.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/universal_service_card.dart';

/// Test page to verify UniversalServiceCard implementation
/// 
/// Run this page to see all three card types in action:
/// - Marketing Card (Type A)
/// - Team Member Card (Type B)
/// - Simple Card (Type C)
/// 
/// Usage:
/// ```dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(builder: (context) => UniversalServiceCardTestPage()),
/// );
/// ```
class UniversalServiceCardTestPage extends StatelessWidget {
  const UniversalServiceCardTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universal Service Card - Test'),
        backgroundColor: const Color(0xFF0A1E4D),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Type A: Marketing Card'),
            const SizedBox(height: 16),
            _buildMarketingCardTest(),
            const SizedBox(height: 40),
            
            _buildSectionTitle('Type B: Team Member Card'),
            const SizedBox(height: 16),
            _buildTeamMemberCardTest(),
            const SizedBox(height: 40),
            
            _buildSectionTitle('Type C: Simple Card'),
            const SizedBox(height: 16),
            _buildSimpleCardTest(),
            const SizedBox(height: 40),
            
            _buildSectionTitle('Horizontal Scrolling Test'),
            const SizedBox(height: 16),
            _buildHorizontalScrollTest(),
            const SizedBox(height: 40),
            
            _buildSectionTitle('Responsive Test'),
            const SizedBox(height: 16),
            _buildResponsiveTest(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1E4D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildMarketingCardTest() {
    return Center(
      child: SizedBox(
        width: 300,
        child: UniversalServiceCard(
          entity: ServiceCardEntity.marketing(
            image: 'assets/images/c.png',
            icon: Icons.villa,
            title: 'بناء وتشييد\nالوحدات السكنية',
            description: 'نقدم خدمات بناء وتشييد الوحدات السكنية بجودة عالية وتصاميم حديثة تناسب جميع الأذواق والمتطلبات',
            isHighlighted: true,
            onTap: () {
              debugPrint('✅ Marketing card tapped!');
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMemberCardTest() {
    return Center(
      child: UniversalServiceCard(
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
            debugPrint('✅ Team member card tapped!');
          },
        ),
      ),
    );
  }

  Widget _buildSimpleCardTest() {
    return Center(
      child: SizedBox(
        width: 360,
        child: UniversalServiceCard(
          entity: ServiceCardEntity.simple(
            icon: Icons.support_agent,
            title: 'خدمة 24/7',
            subtitle: 'راحتكم أولويتنا',
            phoneNumber: '(000) 000-0000',
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalScrollTest() {
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
            width: 300,
            child: UniversalServiceCard(entity: cards[index]),
          );
        },
      ),
    );
  }

  Widget _buildResponsiveTest() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final cardWidth = isMobile ? constraints.maxWidth - 40 : 300.0;
        
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
              ),
              child: Text(
                isMobile 
                    ? '📱 Mobile Mode - Card scaled to 0.75x'
                    : '💻 Desktop Mode - Card at 1.0x scale',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: cardWidth,
                child: UniversalServiceCard(
                  entity: ServiceCardEntity.marketing(
                    image: 'assets/images/c.png',
                    icon: Icons.villa,
                    title: 'Responsive Test',
                    description: 'Resize window to see scaling in action',
                    isHighlighted: true,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
