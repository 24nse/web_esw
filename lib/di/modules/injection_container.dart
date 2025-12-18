import 'package:get_it/get_it.dart';

import '../../data/repositories/award_repository_impl.dart';
import '../../data/repositories/testimonial_repository_impl.dart';
import '../../domain/repositories/award_repository.dart';
import '../../domain/repositories/testimonial_repository.dart';
import '../../domain/usecases/get_awards.dart';
import '../../domain/usecases/get_testimonials.dart';
import '../../presentation/viewmodel/awards_viewmodel.dart';
import '../../presentation/viewmodel/testimonials_viewmodel.dart';

/// Service locator instance
final sl = GetIt.instance;

/// Initializes all dependencies
/// Call this in main() before runApp()
Future<void> initDependencies() async {
  // ============ Repositories ============
  sl.registerLazySingleton<TestimonialRepository>(
    () => TestimonialRepositoryImpl(),
  );
  
  sl.registerLazySingleton<AwardRepository>(
    () => AwardRepositoryImpl(),
  );

  // ============ Use Cases ============
  // Testimonials
  sl.registerLazySingleton(
    () => GetAllTestimonials(sl<TestimonialRepository>()),
  );
  sl.registerLazySingleton(
    () => GetFeaturedTestimonials(sl<TestimonialRepository>()),
  );

  // Awards
  sl.registerLazySingleton(
    () => GetAllAwards(sl<AwardRepository>()),
  );
  sl.registerLazySingleton(
    () => GetLatestAwards(sl<AwardRepository>()),
  );

  // ============ ViewModels ============
  // Using registerFactory for ViewModels so each widget gets a fresh instance
  sl.registerFactory(
    () => TestimonialsViewModel(
      getAllTestimonials: sl<GetAllTestimonials>(),
      getFeaturedTestimonials: sl<GetFeaturedTestimonials>(),
    ),
  );

  sl.registerFactory(
    () => AwardsViewModel(
      getAllAwards: sl<GetAllAwards>(),
      getLatestAwards: sl<GetLatestAwards>(),
    ),
  );
}

/// Resets all registered dependencies
/// Useful for testing
Future<void> resetDependencies() async {
  await sl.reset();
}
