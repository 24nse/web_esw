
import 'package:flutter/material.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/widgets/common/title_section.dart';


class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //     height: 6777,
        //     child:
            Container(
    width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFFF6B35),
          width: 2,
        ),
        color: Colors.white.withOpacity(0.1),
      ),
      child: ClipOval(child:  Image.asset("assets/images/p1.png" , fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.person,
              color: Colors.white.withOpacity(0.5),
              size: 28,
            );
          },))
    // )
    ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 60),
          color: AppColors.bgG,
          child: Column(
            children: [
              // العنوان الفرعي
              TitleSection(
                title:  'الخدمات التي نقدمها',
                des1: 'خدمات تلبي احتياجاتك',
                des2: '\nوحلول مصممة خصيصًا لك',
              ),


              SizedBox(height: 50),


              ServiceSlider(),
              SizedBox(height: 40),

              // زر "View All Services"
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
                      'الاطلاع على جميع الخدمات',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
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
                ],
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

  const ServiceCard({super.key, 
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
                                child: Image.asset(widget.image,fit: BoxFit.cover,)
                              ),
                            ),

                            SizedBox(height: 35),

                            // المحتوى
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
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

                      // الأيقونة
                      Positioned(
                        right: 25,
                        top: 115,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0xFF0A1E4D),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 5),
                          ),
                          child: Icon(
                            widget.icon,
                            color: Colors.white,
                            size: 32,
                          ),
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
  const ServiceSlider({super.key});

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
                image: 'assets/images/c.png',
                icon: Icons.villa,
                title: 'بناء وتشييد\nالوحدات السكنية',
                description: 'نقدم خدمات بناء وتشييد الوحدات السكنية بجودة عالية وتصاميم حديثة تناسب جميع الأذواق والمتطلبات',
                isHighlighted: true,
              ),
              SizedBox(width: 20),
              ServiceCard(
                image: 'assets/images/p.jpg',
                icon: Icons.business_center,
                title: 'المشاريع\nالتجارية',
                description: 'تصميم وتنفيذ المشاريع التجارية من مراكز تسوق ومجمعات تجارية ومباني مكاتب بأفضل المواصفات',
                isHighlighted: false,
              ),
              SizedBox(width: 20),
              ServiceCard(
                image: 'assets/images/p.jpg',
                icon: Icons.construction,
                title: 'التجديدات\nوالتشطيب',
                description: 'خدمات التجديدات والتشطيب الداخلي والخارجي بأحدث المواد وأجود الخامات وبأيدي فنيين متخصصين',
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

