import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/core/responsive/responsive.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/base_section.dart';
import 'package:web_site/presentation/views/widgets/common/universal_service_card.dart';

/// Services Section using UniversalServiceCard
class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LightSection(
      sectionTitle: 'الخدمات التي نقدمها',
      titleDescription1: 'خدمات تلبي احتياجاتك',
      titleDescription2: '\nوحلول مصممة خصيصًا لك',
      children: [
        const ServicesGrid(),
        const SizedBox(height: 40),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'الاطلاع على جميع الخدمات',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFF0A1E4D),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Services Grid using UniversalServiceCard
class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Detect mobile vs other screen sizes using the project's existing responsive system
    final bool isMobile = Responsive.isMobile(context);
    final int crossAxisCount = isMobile ? 2 : 3;

    // Service cards data
    final List<ServiceCardEntity> services = [
      ServiceCardEntity.marketing(
        image: 'assets/images/c.png',
        icon: Icons.villa,
        title: 'بناء وتشييد\nالوحدات السكنية',
        description: 'نقدم خدمات بناء وتشييد الوحدات السكنية بجودة عالية وتصاميم حديثة تناسب جميع الأذواق والمتطلبات',
        isHighlighted: true,
      ),
      ServiceCardEntity.marketing(
        image: 'assets/images/p.jpg',
        icon: Icons.business_center,
        title: 'المشاريع\nالتجارية',
        description: 'تصميم وتنفيذ المشاريع التجارية من مراكز تسوق ومجمعات تجارية ومباني مكاتب بأفضل المواصفات',
        isHighlighted: false,
      ),
      ServiceCardEntity.marketing(
        image: 'assets/images/p.jpg',
        icon: Icons.construction,
        title: 'التجديدات\nوالتشطيب',
        description: 'خدمات التجديدات والتشطيب الداخلي والخارجي بأحدث المواد وأجود الخامات وبأيدي فنيين متخصصين',
        isHighlighted: false,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        const double spacing = 25.0;
        final double itemWidth = (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: services.map((entity) {
            return SizedBox(
              width: itemWidth,
              child: UniversalServiceCard(entity: entity),
            );
          }).toList(),
        );
      },
    );
  }
}
