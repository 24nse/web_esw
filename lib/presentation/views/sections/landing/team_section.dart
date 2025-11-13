
import 'package:flutter/material.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';
import 'package:web_site/presentation/views/widgets/common/section_title.dart';
import 'package:web_site/presentation/views/widgets/common/title_section.dart';


class TeamSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter:  UnifiedRulerTicksPainter(
        // أعلى أفقي
        drawTop: true,
        topMode: UnifiedRulerTicksMode.horizontal,
        topStep: 10,
        topPatternHeights: const [14, 6, 10, 6, 14],
        topMargin: 0,
        topStrokeWidth: 1,
        topColor: Color(0xFFD1D5DB),

        // أسفل أفقي (نفس الإعدادات)
        drawBottom: true,
        bottomMode: UnifiedRulerTicksMode.horizontal,
        bottomStep: 10,
        bottomPatternHeights: const [14, 6, 10, 6, 14],
        bottomMargin: 0,
        bottomStrokeWidth: 1,
        bottomColor: Color(0xFFD1D5DB),
      ),

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 60),
        color: AppColors.bgW,
        child: Column(
          children: [
            // العنوان الفرعي
            SectionTitle(
              title: 'تعرف على فريقنا',
              subTitle: "",
              subTitle1: '',
            ),




            ServiceSlider(),
            SizedBox(height: 40),

          ],
        ),
      ),
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
          // الشكل البرتقالي تحت الكارد مع الـ hover
          Positioned(
            bottom:_isHovered ? -6: -3,
            left: 1,
            right: 1,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),

          // الكارد الرئيسي
          ClipPath(
            clipper: TopCornerClipper(
                clipSize: 70,
                topRadius: 8,
                sideRadius: 8,
                isRight: true
            ),
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.transparent,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // الكارد الرئيسي
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // الصورة
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(18)),
                              child: CustomPaint(
                                foregroundPainter: UnifiedRulerTicksPainter(
                                  isVertical: true,
                                  // الجزء العلوي: مائل
                                  drawTop: true,
                                  topMode: UnifiedRulerTicksMode.diagonal,
                                  topStep: 12,
                                  topPatternHeights: const [12], // كل العلامات نفس الطول (مستمر)
                                  topMargin: 0,
                                  topStrokeWidth: 0.5,
                                  topColor: Color(0xFF5F83C8),
                                  topAngleDeg:60,
                                  topDirection: DiagonalDirection.downRight,

// الجزء السفلي: أفقي
                                  drawBottom: true,
                                  bottomMode: UnifiedRulerTicksMode.horizontal,
                                  bottomStep: 10,
                                  bottomPatternHeights: const [14, 6, 10, 6, 14],
                                  bottomMargin: 0,
                                  bottomStrokeWidth: 0.5,
                                  bottomColor: Color(0xFFD1D5DB),

                                ),

                                child: Container(
                                  height: 200,
                                  width: double.infinity,
                                  color: Color(0xFFE5E7EB),
                                  child: Stack(

                                    children: [
                                      Positioned.fill(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                color: AppColors.bgG
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                color: Color(0xFF01165a),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                           bottom: -100,
                                        left: 17,
                                          child:
                                          SizedBox(
                                            width: 220,
                                            height: 320,

                                            child: Image.asset("assets/images/eng1.png"),
                                          )
                                      )
                                    ],
                                  )
                                ),
                              ),
                            ),

                            // SizedBox(height: 20)

                            // المحتوى
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style: TextStyle(
                                      color: Color(0xFF0A1E4D),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      height: 1.3,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    widget.description,
                                    style: TextStyle(
                                      color: Color(0xFF6B7280),
                                      fontSize: 10,
                                      height: 1.6,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color:  AppColors.gray,
                                            shape: BoxShape.circle,
                                            // borderRadius: BorderRadiusGeometry.circular(4)
                                        ),
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color:  AppColors.gray,
                                            shape: BoxShape.circle,
                                            // borderRadius: BorderRadiusGeometry.circular(4)
                                        ),
                                        child: Icon(
                                          Icons.email,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color:  AppColors.gray,
                                          shape: BoxShape.circle,
                                          // borderRadius: BorderRadiusGeometry.circular(4)
                                        ),
                                        child: Icon(
                                          Icons.link,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
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


class ServiceSlider extends StatefulWidget {
  @override
  _ServiceSliderState createState() => _ServiceSliderState();
}

class _ServiceSliderState extends State<ServiceSlider> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 360,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 360,
      duration: Duration(milliseconds: 300),
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
    return Column(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 10,bottom: 10),
          child: Row(
            children: [
              ServiceCard(
                image: 'assets/residential.jpg',
                icon: Icons.villa,
                title: 'علي سعيد',
                description: 'مهندس مدني',
                isHighlighted: true,
              ),
              SizedBox(width: 20),
              ServiceCard(
                image: 'assets/commercial.jpg',
                icon: Icons.business_center,
                title: 'عبدالله عمر',
                description: 'مهندس مشاريع',
                isHighlighted: false,
              ),
              SizedBox(width: 20),
              ServiceCard(
                image: 'assets/renovation.jpg',
                icon: Icons.construction,
                title: 'فؤاد عمر',
                description: 'مهندس معماري',
                isHighlighted: false,
              ),


            ],
          ),
        ),
        SizedBox(height: 30),

      ],
    );
  }
}

