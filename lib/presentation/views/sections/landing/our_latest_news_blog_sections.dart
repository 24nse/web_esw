import 'package:flutter/material.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';
import 'package:web_site/presentation/views/widgets/graphics/triangle_painter.dart';
import 'package:web_site/presentation/views/widgets/common/title_section.dart';



class OurLatestNewsBlogSections extends StatelessWidget {
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
        color: AppColors.bgW,
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 60),
        child: Column(
          children: [

            TitleSection(
              title:  'الخدمات التي نقدمها',
              des1:'خدمات تلبي احتياجاتك',
              des2: '\nوحلول مصممة خصيصًا لك',
            ),


            SizedBox(height: 50),


            ServiceSlider(),
            SizedBox(height: 40),


          ],
        ),
      ),
    );
  }
}
class OurLatestNewsBlogCard extends StatefulWidget {
  final String image;
  final IconData icon;
  final String title;
  final String description;
  final bool isHighlighted;

  const OurLatestNewsBlogCard({
    required this.image,
    required this.icon,
    required this.title,
    required this.description,
    required this.isHighlighted,
  });

  @override
  State<OurLatestNewsBlogCard> createState() => _OurLatestNewsBlogCardState();
}

class _OurLatestNewsBlogCardState extends State<OurLatestNewsBlogCard> {
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
              width: 300,
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
                        width: 300,
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
                              child: Container(
                                height: 150,
                                width: double.infinity,
                                color: Color(0xFFE5E7EB),
                                child: Image.asset("assets/images/p.jpg",fit: BoxFit.cover,)
                              ),
                            ),

                            SizedBox(height: 20),

                            // المحتوى
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_month, color: AppColors.primary,size: 12,),
                                      SizedBox(width: 5,),
                                      Text("نوفمبر 7,2025",style: TextStyle(fontSize: 12,color: AppColors.textMuted),)
                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                  Text(
                                    widget.title,
                                    style: TextStyle(
                                      color: Color(0xFF0A1E4D),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      height: 1.3,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    widget.description,
                                    style: TextStyle(
                                      color: Color(0xFF6B7280),
                                      fontSize: 12,
                                      height: 1.6,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        'إعرف المزيد',
                                        style: TextStyle(
                                          color: widget.isHighlighted
                                              ? AppColors.primary
                                              : Color(0xFF0A1E4D),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: widget.isHighlighted
                                            ?AppColors.primary
                                            : Color(0xFF0A1E4D),
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


                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -5,
            top: 135,
            child: Container(
              alignment: Alignment.center,
              width: 135,
              height: 25,
              decoration: BoxDecoration(
                color: Color(0xFF01165a),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
              ),
             child: Text("إدارة المشاريع",style: TextStyle(color: Colors.white),),


            ),
          ),
          Positioned(
              top: 160,
              right: -5,
              child:
              CustomPaint(
                size: const Size(8, 8), // حجم المثلث
                painter: TrianglePainter(color: AppColors.primary),
              ),              // Container(
              //
              //   color: AppColors.primary,height: 10,width: 5,)
          )


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
              OurLatestNewsBlogCard(
                image: 'assets/residential.jpg',
                icon: Icons.villa,
                title: 'بناء وتشييد\nالوحدات السكنية',
                description: 'نقدم خدمات بناء وتشييد الوحدات السكنية بجودة عالية وتصاميم حديثة تناسب جميع الأذواق والمتطلبات',
                isHighlighted: true,
              ),
              SizedBox(width: 20),
              OurLatestNewsBlogCard(
                image: 'assets/commercial.jpg',
                icon: Icons.business_center,
                title: 'المشاريع\nالتجارية',
                description: 'تصميم وتنفيذ المشاريع التجارية من مراكز تسوق ومجمعات تجارية ومباني مكاتب بأفضل المواصفات',
                isHighlighted: false,
              ),
              SizedBox(width: 20),
              OurLatestNewsBlogCard(
                image: 'assets/renovation.jpg',
                icon: Icons.construction,
                title: 'التجديدات\nوالتشطيب',
                description: 'خدمات التجديدات والتشطيب الداخلي والخارجي بأحدث المواد وأجود الخامات وبأيدي فنيين متخصصين',
                isHighlighted: false,
              ),


            ],
          ),
        ),
    
      ],
    );
  }
}

