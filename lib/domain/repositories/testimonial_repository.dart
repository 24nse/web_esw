import '../entities/testimonial.dart';

/// Abstract repository interface for testimonials
/// Following Dependency Inversion Principle
abstract class TestimonialRepository {
  /// Gets all testimonials
  Future<List<Testimonial>> getAllTestimonials();

  /// Gets a testimonial by ID
  Future<Testimonial?> getTestimonialById(String id);

  /// Gets featured testimonials (top rated)
  Future<List<Testimonial>> getFeaturedTestimonials({int limit = 6});
}
