import 'package:flutter/material.dart';

import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/widgets/common/title_section.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';
import 'package:web_site/presentation/views/widgets/graphics/diagonal_lines_painter.dart';
import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';

import '../../pages/project_details/project_details_page.dart';
import '../../pages/projects/projects_page.dart';

class CompletedProjectsSection extends StatelessWidget {
  const CompletedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: DiagonalLinesPainter(
            ),
          ),
        ),
        CustomPaint(
          foregroundPainter: UnifiedRulerTicksPainter(
    // أعلى مائل
    drawTop: true,
    topMode: UnifiedRulerTicksMode.diagonal,
    topStep: 12,
    topPatternHeights: const [20],
    topAngleDeg: 60,
    topDirection: DiagonalDirection.downLeft,
    topMargin: 0,
    topStrokeWidth: 1,
    topColor: Color(0xFF5F83C8),

    // أسفل مائل
    drawBottom: true,
    bottomMode: UnifiedRulerTicksMode.diagonal,
    bottomStep: 12,
    bottomPatternHeights: const [20],
    bottomAngleDeg: 60,
    bottomDirection: DiagonalDirection.downLeft,
    bottomMargin: 0,
    bottomStrokeWidth: 1,
    bottomColor: Color(0xFF5F83C8),
    ),

          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 60),
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF001656),
                  // Color(0xFF0A1F44),
                  Color(0xFF132D5E),
                ],
              ),
            ),    child: Column(
              children: [
                // Header
                TitleSection(
                  title: 'أحدث المشاريع',
                  des1:'مشاريعنا ',
                  des2: 'المكتملة',
                  colordse1: AppColors.bgG,


                ),


                const SizedBox(height: 50),

                // First Project - The Business Hub
                ProjectCard(
                  clipper: TopCornerClipper(
                    clipSize: 70,
                    topRadius: 8,
                    sideRadius: 8,
                    isRight: true
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

                // Second Project - Sky Haven
                ProjectCard(
                  clipper: TopCornerClipper(
                    clipSize: 70,
                    topRadius: 8,
                    sideRadius: 8,
                    isLeft: true
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'عرض جميع المشاريع',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProjectsPage()),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF0A1E4D),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            )
          ),
        ),
        Positioned(
          right: -20,
          top: -127,
          child: SizedBox(
            width: 150,
            height: 150,
            // child: DecoratedBox(
            //   decoration: BoxDecoration(
            //
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.12),
            //         blurRadius: 12,
            //         offset: const Offset(0, 6),
            //       )
            //     ],
            //   ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/p1.png",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person,
                      color: Colors.grey[400],
                      size: 40,
                    );
                  },
                ),
              ),
            ),
          ),
        // ),

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
    final imageWidget = ClipPath(
      clipper:clipper,
      // borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 380,
        height: 280,
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
            // Placeholder for image
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.withOpacity(0.3),
                    Colors.blue.withOpacity(0.1),
                  ],
                ),
              ),
              child: Center(
                child:Image.asset('assets/images/c.png',fit: BoxFit.cover,)
              ),
            ),
            // Badges at bottom
            Positioned(
              bottom: 16,
              right: 16,
              child: Row(
                children: [
                  _buildBadge(year),
                  const SizedBox(width: 8),
                  _buildBadge(type),
                  const SizedBox(width: 8),
                  _buildBadge(category),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    final contentWidget = Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.7),
                height: 1.6
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoRow(Icons.location_on, location),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.square_foot, area),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.access_time, duration),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text(
                  'اقرأ المزيد',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFFFF6B35),
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward,
                  color: const Color(0xFFFF6B35),
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProjectDetailsPage()),
        );
      },
      child: ClipPath(
        clipper:clipper,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Row(
            textDirection: imagePosition == ImagePosition.right
                ? TextDirection.ltr
                : TextDirection.rtl,
            children: [
              imageWidget,
              const SizedBox(width: 20),
              contentWidget,
            ],
          ),
        ),
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
            // shape: BoxShape.circle,
            borderRadius: BorderRadiusGeometry.circular(4)
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 14,
          ),
        ),
        const SizedBox(width: 8),

        Text(
          text,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500

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
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

