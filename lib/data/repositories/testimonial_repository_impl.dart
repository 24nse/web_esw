import '../../domain/entities/testimonial.dart';
import '../../domain/repositories/testimonial_repository.dart';

/// Implementation of TestimonialRepository
/// Currently uses mock data, can be replaced with API calls
class TestimonialRepositoryImpl implements TestimonialRepository {
  // Mock data - Replace with API calls in production
  final List<Testimonial> _mockTestimonials = const [
    Testimonial(
      id: '1',
      rating: 5.0,
      title: 'تجاوزوا التوقعات!',
      description:
          'تعاملنا مع الشركة في بناء فيلتنا وكانت التجربة رائعة من البداية للنهاية. الجودة ممتازة والالتزام بالمواعيد والتواصل المستمر جعل المشروع يسير بسلاسة.',
      clientName: 'أحمد الراشد',
      clientLabel: 'عميل سعيد',
    ),
    Testimonial(
      id: '2',
      rating: 5.0,
      title: 'خدمة من الطراز الأول!',
      description:
          'أنصح بشدة بالتعامل مع هذه الشركة. فريق العمل محترف جداً والنتيجة النهائية فاقت توقعاتنا. سعر منافس مع جودة عالية في التنفيذ.',
      clientName: 'سارة المالكي',
      clientLabel: 'عميل سعيد',
    ),
    Testimonial(
      id: '3',
      rating: 5.0,
      title: 'خدمة تتحدث عن نفسها!',
      description:
          'من أفضل شركات المقاولات التي تعاملت معها. الشفافية في التعامل والدقة في التنفيذ والحرص على رضا العميل من أهم ما يميزهم.',
      clientName: 'خالد العتيبي',
      clientLabel: 'عميل سعيد',
    ),
    Testimonial(
      id: '4',
      rating: 5.0,
      title: 'عمل متميز حقاً!',
      description:
          'نفذوا لنا مشروع تجاري كبير وكانت النتيجة مبهرة. الاهتمام بأدق التفاصيل والتصميم الراقي جعل المبنى تحفة معمارية.',
      clientName: 'نورة القحطاني',
      clientLabel: 'عميل سعيد',
    ),
    Testimonial(
      id: '5',
      rating: 5.0,
      title: 'جودة استثنائية!',
      description:
          'تم تسليم المشروع قبل الموعد المحدد وبجودة ممتازة. فريق عمل متعاون ومهني والأسعار تنافسية جداً مقارنة بالسوق.',
      clientName: 'محمد الشهري',
      clientLabel: 'عميل سعيد',
    ),
    Testimonial(
      id: '6',
      rating: 5.0,
      title: 'أنصح بهم بشدة!',
      description:
          'تجربة ممتازة من جميع النواحي. التصميم الداخلي والخارجي راقي جداً والتشطيبات عالية الجودة. شكراً لفريق العمل المميز.',
      clientName: 'فاطمة الدوسري',
      clientLabel: 'عميل سعيد',
    ),
  ];

  @override
  Future<List<Testimonial>> getAllTestimonials() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockTestimonials;
  }

  @override
  Future<Testimonial?> getTestimonialById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _mockTestimonials.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Testimonial>> getFeaturedTestimonials({int limit = 6}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final sorted = List<Testimonial>.from(_mockTestimonials)
      ..sort((a, b) => b.rating.compareTo(a.rating));
    return sorted.take(limit).toList();
  }
}
