
import 'package:flutter/material.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/widgets/common/title_section.dart';
import 'package:web_site/presentation/views/widgets/common/base_section.dart';
import 'package:web_site/core/responsive/responsive.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';

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
class ServiceCard extends StatefulWidget {
  final String image;
  final IconData icon;
  final String title;
  final String description;
  final bool isHighlighted;

  const ServiceCard({
    super.key,
    required this.image,
    required this.icon,
    required this.title,
    required this.description,
    required this.isHighlighted,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background decoration (hover effect)
          Positioned(
            bottom: _isHovered ? -6 : -3,
            left: 5,
            right: 5,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),

          // Main Card with Clipper
          ClipPath(
            clipper: TopCornerClipper(
              clipSize: 70,
              topRadius: 8,
              sideRadius: 8,
              isRight: true,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Service Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            color: const Color(0xFFE5E7EB),
                            child: Image.asset(widget.image, fit: BoxFit.cover),
                          ),
                        ),
                      ),

                      // Floating Icon
                      Positioned(
                        right: 20,
                        bottom: -30,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0A1E4D),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Icon(
                                widget.icon,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  // Card Content
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          widget.title,
                          useFittedBox: true,
                          alignment: Alignment.centerRight,
                          style: const TextStyle(
                            color: Color(0xFF0A1E4D),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 12),
                        AppText(
                          widget.description,
                          useFittedBox: true,
                          alignment: Alignment.centerRight,
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 13,
                            height: 1.5,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            AppText(
                              'إعرف المزيد',
                              useFittedBox: true,
                              style: TextStyle(
                                color: widget.isHighlighted
                                    ? AppColors.primary
                                    : const Color(0xFF0A1E4D),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward,
                              color: widget.isHighlighted
                                  ? AppColors.primary
                                  : const Color(0xFF0A1E4D),
                              size: 18,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Detect mobile vs other screen sizes using the project's existing responsive system
    final bool isMobile = Responsive.isMobile(context);
    final int crossAxisCount = isMobile ? 2 : 3;

    final List<Map<String, dynamic>> services = [
      {
        'image': 'assets/images/c.png',
        'icon': Icons.villa,
        'title': 'بناء وتشييد\nالوحدات السكنية',
        'description': 'نقدم خدمات بناء وتشييد الوحدات السكنية بجودة عالية وتصاميم حديثة تناسب جميع الأذواق والمتطلبات',
        'isHighlighted': true,
      },
      {
        'image': 'assets/images/p.jpg',
        'icon': Icons.business_center,
        'title': 'المشاريع\nالتجارية',
        'description': 'تصميم وتنفيذ المشاريع التجارية من مراكز تسوق ومجمعات تجارية ومباني مكاتب بأفضل المواصفات',
        'isHighlighted': false,
      },
      {
        'image': 'assets/images/p.jpg',
        'icon': Icons.construction,
        'title': 'التجديدات\nوالتشطيب',
        'description': 'خدمات التجديدات والتشطيب الداخلي والخارجي بأحدث المواد وأجود الخامات وبأيدي فنيين متخصصين',
        'isHighlighted': false,
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        const double spacing = 25.0;
        final double itemWidth = (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: services.map((service) {
            return SizedBox(
              width: itemWidth,
              child: ServiceCard(
                image: service['image'],
                icon: service['icon'],
                title: service['title'],
                description: service['description'],
                isHighlighted: service['isHighlighted'],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

