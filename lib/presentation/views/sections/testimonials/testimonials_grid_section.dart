import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../widgets/common/base_section.dart';
import '../../widgets/common/title_section.dart';

/// Testimonials section displaying client reviews in a grid layout
/// Uses WhiteSection for consistent styling
class TestimonialsGridSection extends StatelessWidget {
  const TestimonialsGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    final testimonials = _getTestimonials();

    return WhiteSection(
      sectionTitle: 'آراء العملاء',
      titleDescription1: 'تجارب يشاركها\n',
      titleDescription2: 'عملاؤنا',
      titleSpacing: 50,
      children: [
        _buildTestimonialsGrid(context, testimonials),
      ],
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
