// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:web_site/common/constants/theme/tokens.dart';
//
// class WhoAreYou extends StatelessWidget {
//   const WhoAreYou({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
//       child: Center(
//         child:Flex(
//               // direction: isMobile ? Axis.vertical : Axis.horizontal,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               direction: Axis.horizontal,
//               children: [
//                 // العمود النصي
//                 Expanded(
//                   flex: 1,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("من نحن",
//                           // style: GoogleFonts.cairo(
//                           //   fontSize: 16,
//                           //   color: AppColors.primary,
//                           // )
//                       ),
//                       const SizedBox(height: 8),
//                       RichText(
//                         text: TextSpan(
//                           // style: GoogleFonts.cairo(
//                           //   fontSize: 32,
//                           //   fontWeight: FontWeight.w800,
//                           // ),
//                           children: [
//                             TextSpan(
//                                 text: "نصنع التميز ",
//                                 style: TextStyle(color: AppColors.primary)),
//                             TextSpan(
//                                 text: "في كل مشروع",
//                                 style: TextStyle(color: AppColors.text)),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         "نحن شركة متخصصة في تنفيذ المشاريع السكنية والتجارية "
//                             "مع التركيز على الجودة والابتكار لتقديم أفضل الحلول لعملائنا.",
//                       //   style: GoogleFonts.cairo(
//                       //       fontSize: 16, color: AppColors.textMuted),
//                       ),
//                       const SizedBox(height: 24),
//                       ElevatedButton.icon(
//                         onPressed: () {},
//                         icon: const Icon(Icons.add, size: 18),
//                         label: const Text("اعرف المزيد"),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primary,
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 14, horizontal: 28),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 40, height: 40),
//                 // العمود الثاني (الصورة + الكارد)
//                 Expanded(
//                   flex: 1,
//                   child: Column(
//                     children: [
//                       Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(16),
//                             child: Image.asset(
//                               "assets/images/p.jpg",
//                               height: 220,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 12,
//                             right: 12,
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 6, horizontal: 12),
//                               decoration: BoxDecoration(
//                                 color: AppColors.primary,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Text(
//                                 "25+ سنة خبرة",
//                                 // style: GoogleFonts.cairo(
//                                 //   color: Colors.white,
//                                 //   fontWeight: FontWeight.bold,
//                                 // ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Container(
//                         padding: const EdgeInsets.all(24),
//                         decoration: BoxDecoration(
//                           color: AppColors.text, // خلفية غامقة
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "رسالتنا",
//                               // style: GoogleFonts.cairo(
//                               //     fontSize: 18,
//                               //     fontWeight: FontWeight.bold,
//                               //     color: AppColors.primary),
//                             ),
//                             const SizedBox(height: 12),
//                             Text(
//                               "نلتزم بتقديم حلول مبتكرة تلبي احتياجات عملائنا وتحقق أعلى مستويات الجودة.",
//                             //   style: GoogleFonts.cairo(
//                             //       color: Colors.white, fontSize: 14),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             )
//         ),
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/widgets/common/section_title.dart';

import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';

class WhoAreYou extends StatelessWidget {
  const WhoAreYou({super.key});

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
        height: 600,
        color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 90),
        child: Column(
          // direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: 'من نحن',
              subTitle:'نحن شركة متخصصة في تنفيذ المشاريع السكنية والتجارية',
              subTitle1: 'مع التركيز على الجودة والابتكار لتقديم أفضل الحلول لعملائنا.',
            ),
            Expanded(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: TopRightCornerClipper(
                            clipSize: 70, // حجم القص
                            topRadius: 8, // نصف قطر النقطة العلوية
                            rightRadius: 8, // نصف قطر النقطة اليسرى
                          ),
                          child: Container(
                            height: 250,
                            // width: 300,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage("assets/images/p.jpg"),
                                fit: BoxFit.cover,
                              ),
                              color: AppColors.primary, // لون احتياطي
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 12,
                          left: 12,
                          child: Container(

                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "25+ سنة خبرة",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(child: MissionContainer())



                ],
              ),
            ),
            // العمود الثاني (الصورة + الكارد)
            // const SizedBox(width: 40, height: 40),
          ],
        )

      ),
    );



  }
}

class TopRightCornerClipper extends CustomClipper<Path> {
  final double clipSize;
  final double topRadius; // نصف قطر النقطة العلوية
  final double rightRadius; // نصف قطر النقطة اليمنى

  TopRightCornerClipper({
    this.clipSize = 40,
    this.topRadius = 8,
    this.rightRadius = 8,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    // نبدأ من الزاوية العلوية اليسرى
    path.moveTo(0, 0);

    // الخط العلوي إلى بداية القص (مع حساب الـ radius)
    path.lineTo(size.width - clipSize - topRadius, 0);

    // منحنى النقطة العلوية (بداية القص)
    path.quadraticBezierTo(
      size.width - clipSize, 0, // نقطة التحكم
      size.width - clipSize + topRadius, topRadius, // نقطة النهاية
    );

    // الخط المائل
    path.lineTo(size.width - rightRadius, clipSize - rightRadius);

    // منحنى النقطة اليمنى (نهاية القص)
    path.quadraticBezierTo(
      size.width, clipSize, // نقطة التحكم
      size.width, clipSize + rightRadius, // نقطة النهاية
    );

    // الخط الأيمن إلى الأسفل
    path.lineTo(size.width, size.height);

    // الخط السفلي
    path.lineTo(0, size.height);

    // الخط الأيسر للأعلى
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class MissionContainer extends StatelessWidget {
  const MissionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 250,
      // margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF0A1E4D), // اللون الأزرق الداكن
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // العمود البرتقالي على اليسار
          Positioned(
            right: 0.5,
            top: 16,
            bottom: 14,
            child: Container(
              width: 6,
              decoration: BoxDecoration(
                color: AppColors.primary,  // اللون البرتقالي
                // color: Color(0xFFFF6B4A),  // اللون البرتقالي
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
          ),

          // المحتوى الرئيسي
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // النص الرئيسي
              Padding(
                padding: EdgeInsets.fromLTRB(25, 30, 25, 20),
                child: Text(
                  'نحن شركة رائدة في مجال المقاولات العامة، نقدم حلولاً متكاملة لمشاريع البناء والتشييد. نلتزم بأعلى معايير الجودة والسلامة في تنفيذ المشاريع السكنية والتجارية والصناعية بكفاءة واحترافية عالية.',                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.6,
                    letterSpacing: 0.3,
                  ),
                ),
              ),

              // قسم "Our Mission" مع الأزرار
              Container(
                padding: EdgeInsets.fromLTRB(25, 15, 20, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // عنوان "Our Mission"
                    Text(

                      'مهمتنا',
                      style: TextStyle(
                        color: AppColors.primary, // اللون البرتقالي
                        // color: Color(0xFFFF6B4A), // اللون البرتقالي
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),

                    // الأزرار
                    Row(
                      children: [
                        // زر Plus في دائرة مع حدود
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),

                        SizedBox(width: 12),

                        // زر السهم في دائرة برتقالية
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary, // اللون البرتقالي
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


