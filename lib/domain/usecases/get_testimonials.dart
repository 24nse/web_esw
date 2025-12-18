import '../entities/testimonial.dart';
import '../repositories/testimonial_repository.dart';

/// Use case for getting all testimonials
/// Following Single Responsibility Principle
class GetAllTestimonials {
  final TestimonialRepository repository;

  const GetAllTestimonials(this.repository);

  Future<List<Testimonial>> call() {
    return repository.getAllTestimonials();
  }
}

/// Use case for getting featured testimonials
class GetFeaturedTestimonials {
  final TestimonialRepository repository;

  const GetFeaturedTestimonials(this.repository);

  Future<List<Testimonial>> call({int limit = 6}) {
    return repository.getFeaturedTestimonials(limit: limit);
  }
}
