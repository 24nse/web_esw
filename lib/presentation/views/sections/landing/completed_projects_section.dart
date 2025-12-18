import 'package:flutter/material.dart';

import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/widgets/common/title_section.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';
import 'package:web_site/presentation/views/widgets/graphics/diagonal_lines_painter.dart';
import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';

import '../../pages/project_details/project_details_page.dart';
import '../../pages/projects/projects_page.dart';

import 'package:web_site/common/utils/responsive_helper.dart';
import 'package:web_site/presentation/views/widgets/common/base_section.dart';

class CompletedProjectsSection extends StatelessWidget {
  const CompletedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DarkSection(
      sectionTitle: 'أحدث المشاريع',
      titleDescription1: 'مشاريعنا ',
      titleDescription2: 'المكتملة',
      titleColor1: AppColors.bgG,
      children: [
        const SizedBox(height: 50),
        ProjectCard(
          clipper: TopCornerClipper(
            clipSize: 70,
            topRadius: 8,
            sideRadius: 8,
            isRight: true,
          ),
          imagePath: 'assets/business_hub.jpg',
          title: 'مركز الأعمال الرئيسي',
          description: 'مشروع عقاري متكامل يجمع بين التصميم العصري والوظائف المتعددة، يوفر بيئة عمل مثالية للشركات الكبرى',
          location: 'الرياض، المملكة العربية السعودية',
          area: '45,000 متر مربع',
          duration: '24 شهر',
          year: '2023',
          type: 'تجاري',
          category: 'مباني تجارية',
          imagePosition: ImagePosition.left,
        ),
        const SizedBox(height: 30),
        ProjectCard(
          clipper: TopCornerClipper(
            clipSize: 70,
            topRadius: 8,
            sideRadius: 8,
            isLeft: true,
          ),
          imagePath: 'assets/images/c.png',
          title: 'أبراج السماء',
          description: 'مجمع سكني فاخر يتميز بإطلالات بانورامية ومرافق حديثة، يضم وحدات سكنية راقية بأعلى معايير الجودة',
          location: 'جدة، المملكة العربية السعودية',
          area: '32,500 متر مربع',
          duration: '18 شهر',
          year: '2024',
          type: 'سكني',
          category: 'مباني سكنية',
          imagePosition: ImagePosition.right,
        ),
        const SizedBox(height: 40),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProjectsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'عرض جميع المشاريع',
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

enum ImagePosition { left, right }

class ProjectCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String location;
  final String area;
  final String duration;
  final String year;
  final String type;
  final String category;
  final ImagePosition imagePosition;
  final CustomClipper<Path>? clipper;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.location,
    required this.area,
    required this.duration,
    required this.year,
    required this.type,
    required this.category,
    required this.imagePosition,
    this.clipper,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    final imageWidget = ClipPath(
      clipper: clipper,
      child: Container(
        width: isMobile ? double.infinity : 380,
        height: isMobile ? 200 : 280,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/c.png', fit: BoxFit.cover),
            Positioned(
              bottom: 16,
              right: 16,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildBadge(year),
                  _buildBadge(type),
                  _buildBadge(category),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    final contentWidget = Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: isMobile ? 22 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.7),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          _buildInfoRow(Icons.location_on, location),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.square_foot, area),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.access_time, duration),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProjectDetailsPage()),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'اقرأ المزيد',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFF6B35),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_back,
                  color: Color(0xFFFF6B35),
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: isMobile
          ? Column(
              children: [
                imageWidget,
                contentWidget,
              ],
            )
          : Row(
              textDirection: imagePosition == ImagePosition.right
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              children: [
                imageWidget,
                const SizedBox(width: 20),
                Expanded(child: contentWidget),
              ],
            ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFFFF6B35),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 14,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

