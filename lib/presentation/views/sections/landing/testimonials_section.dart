import 'package:flutter/material.dart';

import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/widgets/common/title_section.dart';



class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({Key? key}) : super(key: key);

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  int _currentPage = 0;

  final List<TestimonialData> testimonials = [
    TestimonialData(
      rating: 5.0,
      title: 'فاق التوقعات!',
      content:
      'تجربة استثنائية في التعامل مع الشركة، حيث تم إنجاز المشروع بأعلى معايير الجودة وفي الوقت المحدد. فريق محترف ومتعاون للغاية',
      clientName: 'عبدالله السعيد',
      clientPosition: 'مستثمر عقاري',
      clientImage: 'assets/images/c.png',
    ),
    TestimonialData(
      rating: 5.0,
      title: 'خدمة من الدرجة الأولى!',
      content:
      'نحن سعداء جداً بالنتيجة النهائية لمشروعنا السكني. الاهتمام بالتفاصيل والالتزام بالمواعيد كان رائعاً. أنصح بالتعامل معهم',
      clientName: ' نوح سعيد',
      clientPosition: 'مالك عقارات',
      clientImage: 'assets/images/c.png',
    ),
    TestimonialData(
      rating: 5.0,
      title: 'خدمة من الدرجة الأولى!',
      content:
      'نحن سعداء جداً بالنتيجة النهائية لمشروعنا السكني. الاهتمام بالتفاصيل والالتزام بالمواعيد كان رائعاً. أنصح بالتعامل معهم',
      clientName: ' نوح سعيد',
      clientPosition: 'مالك عقارات',
      clientImage: 'assets/images/c.png',
    ),
    TestimonialData(
      rating: 5.0,
      title: 'خدمة من الدرجة الأولى!',
      content:
      'نحن سعداء جداً بالنتيجة النهائية لمشروعنا السكني. الاهتمام بالتفاصيل والالتزام بالمواعيد كان رائعاً. أنصح بالتعامل معهم',
      clientName: ' نوح سعيد',
      clientPosition: 'مالك عقارات',
      clientImage: 'assets/images/c.png',
    ),
    TestimonialData(
      rating: 5.0,
      title: 'خدمة من الدرجة الأولى!',
      content:
      'نحن سعداء جداً بالنتيجة النهائية لمشروعنا السكني. الاهتمام بالتفاصيل والالتزام بالمواعيد كان رائعاً. أنصح بالتعامل معهم',
      clientName: ' نوح سعيد',
      clientPosition: 'مالك عقارات',
      clientImage: 'assets/images/c.png',
    ),
    TestimonialData(
      rating: 5.0,
      title: 'خدمة من الدرجة الأولى!',
      content:
      'نحن سعداء جداً بالنتيجة النهائية لمشروعنا السكني. الاهتمام بالتفاصيل والالتزام بالمواعيد كان رائعاً. أنصح بالتعامل معهم',
      clientName: ' نوح سعيد',
      clientPosition: 'مالك عقارات',
      clientImage: 'assets/images/c.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
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
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A1F44),
              Color(0xFF132D5E),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          children: [
            TitleSection(
              title:    'آراء العملاء',
              des1: 'التجارب المشتركة من\n',
              des2: 'عملائنا',
              colordse1:  AppColors.bgG,
            ),


            const SizedBox(height: 60),
            // Testimonials Cards
            SizedBox(
              height: 290,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: (testimonials.length / 2).ceil(),
                itemBuilder: (context, pageIndex) {
                  int startIndex = pageIndex * 2;
                  int endIndex = (startIndex + 2 > testimonials.length)
                      ? testimonials.length
                      : startIndex + 2;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = startIndex; i < endIndex; i++) ...[
                        Flexible(
                          child: TestimonialCard(
                            data: testimonials[i],
                          ),
                        ),
                        if (i < endIndex - 1) const SizedBox(width: 30),
                      ],
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            // Pagination Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                (testimonials.length / 2).ceil(),
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: index == _currentPage ? 40 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: index == _currentPage
                        ? const Color(0xFFFF6B35)
                        : Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestimonialData {
  final double rating;
  final String title;
  final String content;
  final String clientName;
  final String clientPosition;
  final String clientImage;

  TestimonialData({
    required this.rating,
    required this.title,
    required this.content,
    required this.clientName,
    required this.clientPosition,
    required this.clientImage,
  });
}

class TestimonialCard extends StatelessWidget {
  final TestimonialData data;

  const TestimonialCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),

      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(
        //   color: Colors.white.withOpacity(0.1),
        //   width: 1,
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: List.generate(
                  5,
                      (index) => const Icon(
                    Icons.star,
                    color: Color(0xFFFF6B35),
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                data.rating.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white

                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Title
          Text(
            data.title,
            textDirection: TextDirection.rtl,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white

            ),
          ),
          const SizedBox(height: 12),
          // Content
          Text(
            data.content,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            maxLines: 3,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.7),
              height: 1.6

            ),
          ),
          const SizedBox(height: 24),
          // Client Info
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                child: ClipOval(
                  child: Image.asset(
                    data.clientImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.person,
                        color: Colors.white.withOpacity(0.5),
                        size: 28,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.clientName,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white

                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.clientPosition,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.6)

                    ),
                  ),
                ],
              ),
              // Client Avatar
            ],
          ),
        ],
      ),
    );
  }
}
