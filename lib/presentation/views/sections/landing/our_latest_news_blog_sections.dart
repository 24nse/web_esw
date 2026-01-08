import 'package:flutter/material.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/pages/blog_details/blog_details_page.dart';
import 'package:web_site/presentation/views/widgets/common/base_section.dart';
import 'package:web_site/presentation/views/widgets/common/universal_service_card.dart';

/// Blog/News Section using UniversalServiceCard
class OurLatestNewsBlogSections extends StatelessWidget {
  const OurLatestNewsBlogSections({super.key});

  @override
  Widget build(BuildContext context) {
    return const WhiteSection(
      sectionTitle: 'الأخبار والمدونات',
      titleDescription1: 'آخر الأخبار',
      titleDescription2: '\nالمدونات',
      children: [
        ServiceSlider(),
      ],
    );
  }
}

/// Service Slider using UniversalServiceCard
class ServiceSlider extends StatefulWidget {
  const ServiceSlider({super.key});

  @override
  State<ServiceSlider> createState() => _ServiceSliderState();
}

class _ServiceSliderState extends State<ServiceSlider> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 360,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 360,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Blog posts data
    final List<ServiceCardEntity> blogPosts = [
      ServiceCardEntity.blogNews(
        image: 'assets/images/p.jpg',
        icon: Icons.villa,
        title: 'بناء وتشييد\nالوحدات السكنية',
        description: 'نقدم خدمات بناء وتشييد الوحدات السكنية بجودة عالية وتصاميم حديثة تناسب جميع الأذواق والمتطلبات',
        date: 'نوفمبر 7, 2025',
        category: 'إدارة المشاريع',
        isHighlighted: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BlogDetailsPage()),
          );
        },
      ),
      ServiceCardEntity.blogNews(
        image: 'assets/images/p.jpg',
        icon: Icons.business_center,
        title: 'المشاريع\nالتجارية',
        description: 'تصميم وتنفيذ المشاريع التجارية من مراكز تسوق ومجمعات تجارية ومباني مكاتب بأفضل المواصفات',
        date: 'نوفمبر 5, 2025',
        category: 'التصميم المعماري',
        isHighlighted: false,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BlogDetailsPage()),
          );
        },
      ),
      ServiceCardEntity.blogNews(
        image: 'assets/images/p.jpg',
        icon: Icons.construction,
        title: 'التجديدات\nوالتشطيب',
        description: 'خدمات التجديدات والتشطيب الداخلي والخارجي بأحدث المواد وأجود الخامات وبأيدي فنيين متخصصين',
        date: 'نوفمبر 3, 2025',
        category: 'التشطيبات',
        isHighlighted: false,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BlogDetailsPage()),
          );
        },
      ),
    ];

    return Column(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              for (int i = 0; i < blogPosts.length; i++) ...[
                UniversalServiceCard(entity: blogPosts[i]),
                if (i < blogPosts.length - 1) const SizedBox(width: 20),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
