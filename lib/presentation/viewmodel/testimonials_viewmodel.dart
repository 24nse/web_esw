import '../../domain/entities/testimonial.dart';
import '../../domain/usecases/get_testimonials.dart';
import 'base_viewmodel.dart';

/// ViewModel for Testimonials feature
/// Manages testimonial data and UI state following MVVM pattern
class TestimonialsViewModel extends BaseViewModel {
  final GetAllTestimonials _getAllTestimonials;
  final GetFeaturedTestimonials _getFeaturedTestimonials;

  List<Testimonial> _testimonials = [];
  List<Testimonial> _featuredTestimonials = [];

  TestimonialsViewModel({
    required GetAllTestimonials getAllTestimonials,
    required GetFeaturedTestimonials getFeaturedTestimonials,
  })  : _getAllTestimonials = getAllTestimonials,
        _getFeaturedTestimonials = getFeaturedTestimonials;

  /// All testimonials
  List<Testimonial> get testimonials => _testimonials;

  /// Featured testimonials (for homepage)
  List<Testimonial> get featuredTestimonials => _featuredTestimonials;

  /// Whether testimonials have been loaded
  bool get hasTestimonials => _testimonials.isNotEmpty;

  /// Total count of testimonials
  int get testimonialCount => _testimonials.length;

  /// Average rating across all testimonials
  double get averageRating {
    if (_testimonials.isEmpty) return 0;
    final total = _testimonials.fold(0.0, (sum, t) => sum + t.rating);
    return total / _testimonials.length;
  }

  /// Loads all testimonials
  Future<void> loadTestimonials() async {
    final result = await executeAsync(() => _getAllTestimonials());
    if (result != null) {
      _testimonials = result;
      notifyListeners();
    }
  }

  /// Loads featured testimonials
  Future<void> loadFeaturedTestimonials({int limit = 6}) async {
    final result = await executeAsync(
      () => _getFeaturedTestimonials(limit: limit),
    );
    if (result != null) {
      _featuredTestimonials = result;
      notifyListeners();
    }
  }

  /// Refreshes all testimonial data
  Future<void> refresh() async {
    await loadTestimonials();
    await loadFeaturedTestimonials();
  }

  /// Filters testimonials by minimum rating
  List<Testimonial> filterByRating(double minRating) {
    return _testimonials.where((t) => t.rating >= minRating).toList();
  }

  /// Gets a testimonial by ID
  Testimonial? getTestimonialById(String id) {
    try {
      return _testimonials.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }
}
