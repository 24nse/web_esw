# Project Optimization & MVVM Implementation Plan

## Current Architecture Analysis

### ✅ What's Already Good:
- Clean Architecture layers exist: `domain/`, `data/`, `presentation/`
- Entities are defined: `TeamMember`, `BlogPost`, `ProjectDetails`
- Use cases follow single responsibility: `GetTeamMemberDetails`, `GetBlogPosts`
- Repository pattern implemented

### ❌ Issues Found:

1. **Missing ViewModels** - `presentation/viewmodel/` is empty
2. **Hardcoded data in Views** - Testimonials, Awards have data embedded in widgets
3. **No State Management** - Using `setState` directly instead of proper state management
4. **Missing Dependency Injection** - `di/` folder exists but not implemented
5. **Duplicate Model Classes** - `TestimonialItem`, `AwardItem` defined inside widget files
6. **No Base Classes** - No base ViewModel, UseCase, or Repository patterns

---

## Recommended Optimizations

### 1. Create Domain Entities

```
lib/domain/entities/
├── testimonial.dart       # NEW
├── award.dart             # NEW
├── team_member.dart       # EXISTS
├── blog_post.dart         # EXISTS
└── project_details.dart   # EXISTS
```

### 2. Create Repositories

```
lib/domain/repositories/
├── testimonial_repository.dart  # NEW
├── award_repository.dart        # NEW
└── ...existing...

lib/data/repositories/
├── testimonial_repository_impl.dart  # NEW
├── award_repository_impl.dart        # NEW
└── ...existing...
```

### 3. Create ViewModels (MVVM)

```
lib/presentation/viewmodel/
├── base_viewmodel.dart           # Base class with loading, error states
├── testimonials_viewmodel.dart   # Testimonials page state
├── awards_viewmodel.dart         # Awards section state
├── about_viewmodel.dart          # About page state
└── home_viewmodel.dart           # Home page state
```

### 4. Implement State Management

Recommended: **Provider** or **Riverpod**

```dart
// Example ViewModel Pattern
class TestimonialsViewModel extends ChangeNotifier {
  final GetTestimonials _getTestimonials;
  
  List<Testimonial> _testimonials = [];
  bool _isLoading = false;
  String? _error;
  
  // Getters
  List<Testimonial> get testimonials => _testimonials;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  Future<void> loadTestimonials() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _testimonials = await _getTestimonials();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    
    _isLoading = false;
    notifyListeners();
  }
}
```

### 5. Setup Dependency Injection

Using **get_it** package:

```dart
// lib/di/injection_container.dart
final sl = GetIt.instance;

Future<void> init() async {
  // ViewModels
  sl.registerFactory(() => TestimonialsViewModel(sl()));
  sl.registerFactory(() => AwardsViewModel(sl()));
  
  // Use Cases
  sl.registerLazySingleton(() => GetTestimonials(sl()));
  sl.registerLazySingleton(() => GetAwards(sl()));
  
  // Repositories
  sl.registerLazySingleton<TestimonialRepository>(
    () => TestimonialRepositoryImpl(),
  );
}
```

---

## Priority Implementation Tasks

### Phase 1: Core Infrastructure
1. [ ] Create `BaseViewModel` class
2. [ ] Setup dependency injection with `get_it`
3. [ ] Add `provider` for state management

### Phase 2: Testimonials Refactoring
1. [ ] Create `Testimonial` entity
2. [ ] Create `TestimonialRepository`
3. [ ] Create `GetTestimonials` use case
4. [ ] Create `TestimonialsViewModel`
5. [ ] Refactor `TestimonialsGridSection` to use ViewModel

### Phase 3: Awards Refactoring
1. [ ] Create `Award` entity
2. [ ] Create `AwardRepository`
3. [ ] Create `GetAwards` use case
4. [ ] Create `AwardsViewModel`
5. [ ] Refactor `AwardsSection` to use ViewModel

### Phase 4: About Page Refactoring
1. [ ] Create `AboutViewModel`
2. [ ] Remove unused state variables
3. [ ] Implement proper loading/error states

---

## Additional Optimizations

### Code Quality
- [ ] Extract magic numbers to constants
- [ ] Use `const` constructors where possible
- [ ] Add proper error handling with `Either` pattern
- [ ] Implement `Equatable` for entities

### Performance
- [ ] Add `const` to immutable widgets
- [ ] Implement widget caching with `AutomaticKeepAliveClientMixin`
- [ ] Use `ListView.builder` for large lists
- [ ] Optimize image loading with `cached_network_image`

### UI/UX
- [ ] Extract reusable card components
- [ ] Create consistent spacing constants
- [ ] Implement shimmer loading effects
- [ ] Add proper error state UI

---

## Files to Create

Would you like me to implement any of these optimizations? Please choose:

1. **Full MVVM for Testimonials** - Entity, Repository, UseCase, ViewModel
2. **Full MVVM for Awards** - Entity, Repository, UseCase, ViewModel  
3. **Setup Dependency Injection** - get_it configuration
4. **Create Base Classes** - BaseViewModel, BaseRepository
5. **All of the above** - Complete refactoring
