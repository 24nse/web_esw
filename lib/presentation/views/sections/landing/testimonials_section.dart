import 'package:flutter/material.dart';
import 'package:web_site/presentation/views/pages/testimonials/testimonials_page.dart';

import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/widgets/common/title_section.dart';



import 'package:web_site/common/utils/responsive_helper.dart';
import 'package:web_site/presentation/views/widgets/common/base_section.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  int _currentPage = 0;

  final List<TestimonialData> testimonials = [
    TestimonialData(
      rating: 5.0,
      title: 'فاق التوقعات!',
      content: 'تجربة استثنائية في التعامل مع الشركة، حيث تم إنجاز المشروع بأعلى معايير الجودة وفي الوقت المحدد. فريق محترف ومتعاون للغاية',
      clientName: 'عبدالله السعيد',
      clientPosition: 'مستثمر عقاري',
      clientImage: 'assets/images/c.png',
    ),
    TestimonialData(
      rating: 5.0,
      title: 'خدمة من الدرجة الأولى!',
      content: 'نحن سعداء جداً بالنتيجة النهائية لمشروعنا السكني. الاهتمام بالتفاصيل والالتزام بالمواعيد كان رائعاً. أنصح بالتعامل معهم',
      clientName: ' نوح سعيد',
      clientPosition: 'مالك عقارات',
      clientImage: 'assets/images/c.png',
    ),
    TestimonialData(
      rating: 5.0,
      title: 'احترافية عالية',
      content: 'فريق عمل متميز يمتلك خبرة واسعة في مجال المقاولات. تم تنفيذ المشروع بدقة متناهية وبجودة تفوق الوصف.',
      clientName: 'سارة أحمد',
      clientPosition: 'مديرة مشاريع',
      clientImage: 'assets/images/c.png',
    ),
    TestimonialData(
      rating: 5.0,
      title: 'جودة لا تضاهى',
      content: 'من أفضل الشركات التي تعاملت معها في مجال البناء. التزام تام بالمواعيد والمواصفات المتفق عليها.',
      clientName: 'محمد العتيبي',
      clientPosition: 'رجل أعمال',
      clientImage: 'assets/images/c.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final itemsPerPage = isMobile ? 1 : 2;
    final pageCount = (testimonials.length / itemsPerPage).ceil();

    return DarkSection(
      sectionTitle: 'آراء العملاء',
      titleDescription1: 'التجارب المشتركة من\n',
      titleDescription2: 'عملائنا',
      titleColor1: AppColors.bgG,
      children: [
        SizedBox(
          height: isMobile ? 320 : 300,
          child: PageView.builder(
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: pageCount,
            itemBuilder: (context, pageIndex) {
              int startIndex = pageIndex * itemsPerPage;
              int endIndex = (startIndex + itemsPerPage > testimonials.length)
                  ? testimonials.length
                  : startIndex + itemsPerPage;

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = startIndex; i < endIndex; i++) ...[
                    Flexible(
                      child: TestimonialCard(data: testimonials[i]),
                    ),
                    if (i < endIndex - 1) const SizedBox(width: 24),
                  ],
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pageCount,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: index == _currentPage ? 32 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: index == _currentPage ? AppColors.primary : Colors.white24,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        const SizedBox(height: 48),
        Center(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('عرض جميع المشاريع', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TestimonialsPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFF0A1E4D),
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ],
          ),
        ),
      ],
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
    super.key,
    required this.data,
  });

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
