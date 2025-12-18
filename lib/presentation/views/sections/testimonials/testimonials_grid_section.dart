import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../widgets/common/title_section.dart';

/// Testimonials section displaying client reviews in a grid layout
/// Design based on the "Experience Shared by Our Clients" UI pattern
class TestimonialsGridSection extends StatelessWidget {
  const TestimonialsGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    final testimonials = _getTestimonials();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      color: AppColors.bgW,
      child: Column(
        children: [
          // Header with decorative crane
          _buildHeaderWithDecoration(context),
          const SizedBox(height: 50),
          // Testimonials Grid
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _buildTestimonialsGrid(context, testimonials),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the header section with decorative crane image
  Widget _buildHeaderWithDecoration(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: TitleSection(
            title: 'آراء العملاء',
            des1: 'تجارب يشاركها\n',
            des2: 'عملاؤنا',
          ),
        ),
        // Decorative crane on the right (only on larger screens)
        if (MediaQuery.of(context).size.width > 800)
          Positioned(
            right: 80,
            top: -20,
            child: _buildCraneDecoration(),
          ),
      ],
    );
  }

  /// Builds the decorative crane hook
  Widget _buildCraneDecoration() {
    return Container(
      width: 120,
      height: 150,
      child: CustomPaint(
        painter: CraneHookPainter(),
      ),
    );
  }

  /// Builds the testimonials grid
  Widget _buildTestimonialsGrid(
      BuildContext context, List<TestimonialItem> testimonials) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 700 ? 2 : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: crossAxisCount == 2 ? 1.3 : 1.5,
          ),
          itemCount: testimonials.length,
          itemBuilder: (context, index) {
            return _buildTestimonialCard(testimonials[index]);
          },
        );
      },
    );
  }

  /// Builds individual testimonial card
  Widget _buildTestimonialCard(TestimonialItem testimonial) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.black.withOpacity(0.1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Star rating
          _buildStarRating(testimonial.rating),
          const SizedBox(height: 16),
          // Title
          Text(
            testimonial.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryDark,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 12),
          // Description
          Expanded(
            child: Text(
              testimonial.description,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 1),
          // Client info
          _buildClientInfo(testimonial),
        ],
      ),
    );
  }

  /// Builds star rating row
  Widget _buildStarRating(double rating) {
    return Row(
      children: [
        // 5 Stars
        ...List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Icon(
              Icons.star,
              size: 20,
              color: index < rating.floor()
                  ? AppColors.primary
                  : Colors.grey[300],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryDark,
          ),
        ),
      ],
    );
  }

  /// Builds client info section with avatar and name
  Widget _buildClientInfo(TestimonialItem testimonial) {
    return Row(
      children: [
        // Avatar
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
            image: testimonial.avatarUrl != null
                ? DecorationImage(
                    image: AssetImage(testimonial.avatarUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: testimonial.avatarUrl == null
              ? Icon(Icons.person, color: Colors.grey[400], size: 24)
              : null,
        ),
        const SizedBox(width: 12),
        // Name and label
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              testimonial.clientName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDark,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              testimonial.clientLabel,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Returns list of testimonial items
  List<TestimonialItem> _getTestimonials() {
    return [
      TestimonialItem(
        rating: 5.0,
        title: 'تجاوزوا التوقعات!',
        description:
            'تعاملنا مع الشركة في بناء فيلتنا وكانت التجربة رائعة من البداية للنهاية. الجودة ممتازة والالتزام بالمواعيد والتواصل المستمر جعل المشروع يسير بسلاسة.',
        clientName: 'أحمد الراشد',
        clientLabel: 'عميل سعيد',
      ),
      TestimonialItem(
        rating: 5.0,
        title: 'خدمة من الطراز الأول!',
        description:
            'أنصح بشدة بالتعامل مع هذه الشركة. فريق العمل محترف جداً والنتيجة النهائية فاقت توقعاتنا. سعر منافس مع جودة عالية في التنفيذ.',
        clientName: 'سارة المالكي',
        clientLabel: 'عميل سعيد',
      ),
      TestimonialItem(
        rating: 5.0,
        title: 'خدمة تتحدث عن نفسها!',
        description:
            'من أفضل شركات المقاولات التي تعاملت معها. الشفافية في التعامل والدقة في التنفيذ والحرص على رضا العميل من أهم ما يميزهم.',
        clientName: 'خالد العتيبي',
        clientLabel: 'عميل سعيد',
      ),
      TestimonialItem(
        rating: 5.0,
        title: 'عمل متميز حقاً!',
        description:
            'نفذوا لنا مشروع تجاري كبير وكانت النتيجة مبهرة. الاهتمام بأدق التفاصيل والتصميم الراقي جعل المبنى تحفة معمارية.',
        clientName: 'نورة القحطاني',
        clientLabel: 'عميل سعيد',
      ),
      TestimonialItem(
        rating: 5.0,
        title: 'جودة استثنائية!',
        description:
            'تم تسليم المشروع قبل الموعد المحدد وبجودة ممتازة. فريق عمل متعاون ومهني والأسعار تنافسية جداً مقارنة بالسوق.',
        clientName: 'محمد الشهري',
        clientLabel: 'عميل سعيد',
      ),
      TestimonialItem(
        rating: 5.0,
        title: 'أنصح بهم بشدة!',
        description:
            'تجربة ممتازة من جميع النواحي. التصميم الداخلي والخارجي راقي جداً والتشطيبات عالية الجودة. شكراً لفريق العمل المميز.',
        clientName: 'فاطمة الدوسري',
        clientLabel: 'عميل سعيد',
      ),
    ];
  }
}

/// Custom painter for the crane hook decoration
class CraneHookPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final orangePaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    final darkPaint = Paint()
      ..color = AppColors.primaryDark
      ..style = PaintingStyle.fill;

    final grayPaint = Paint()
      ..color = Colors.grey[400]!
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;

    // Draw cable/chain
    for (int i = 0; i < 8; i++) {
      final y = i * 12.0;
      final isEven = i % 2 == 0;
      
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(centerX, y + 6),
          width: 8,
          height: 12,
        ),
        grayPaint,
      );
    }

    // Draw pulley wheel
    canvas.drawCircle(
      Offset(centerX, 100),
      25,
      orangePaint,
    );
    canvas.drawCircle(
      Offset(centerX, 100),
      15,
      darkPaint,
    );
    canvas.drawCircle(
      Offset(centerX, 100),
      8,
      orangePaint,
    );

    // Draw hook
    final hookPath = Path();
    hookPath.moveTo(centerX - 5, 125);
    hookPath.lineTo(centerX + 5, 125);
    hookPath.lineTo(centerX + 5, 140);
    hookPath.quadraticBezierTo(centerX + 20, 145, centerX + 15, 160);
    hookPath.quadraticBezierTo(centerX + 10, 175, centerX - 5, 165);
    hookPath.quadraticBezierTo(centerX - 15, 155, centerX - 10, 145);
    hookPath.lineTo(centerX - 5, 140);
    hookPath.close();
    
    canvas.drawPath(hookPath, grayPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Model class for testimonial items
class TestimonialItem {
  final double rating;
  final String title;
  final String description;
  final String clientName;
  final String clientLabel;
  final String? avatarUrl;

  const TestimonialItem({
    required this.rating,
    required this.title,
    required this.description,
    required this.clientName,
    required this.clientLabel,
    this.avatarUrl,
  });
}
