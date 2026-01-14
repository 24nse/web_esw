# Quick Reference - Design Patterns & Best Practices

A quick reference guide for the design patterns and architectural improvements implemented in this project.

---

## 🎨 Design Patterns Used

### 1. **Strategy Pattern** ✅ (Already Implemented)
**Location:** `lib/presentation/views/widgets/common/strategies/`

**Purpose:** Different rendering strategies for different card types

**Usage:**
```dart
final strategy = ServiceCardStrategyFactory.getStrategy(ServiceCardType.teamMember);
final widget = strategy.build(context, entity, config);
```

---

### 2. **Factory Pattern** ✅ (Already Implemented)
**Location:** `lib/presentation/views/widgets/common/strategies/service_card_strategy_factory.dart`

**Purpose:** Create appropriate strategy based on card type

**Usage:**
```dart
final strategy = ServiceCardStrategyFactory.getStrategyFromEntity(entity);
```

---

### 3. **Repository Pattern** ✅ (Enhanced)
**Location:** `lib/domain/repositories/` & `lib/data/repositories/`

**Purpose:** Abstract data access layer

**Usage:**
```dart
abstract class TeamRepository {
  Future<Result<List<TeamMember>>> getAllTeamMembers();
}

class TeamRepositoryImpl implements TeamRepository {
  @override
  Future<Result<List<TeamMember>>> getAllTeamMembers() async {
    // Implementation
  }
}
```

---

### 4. **Result/Either Pattern** 🆕 (New)
**Location:** `lib/core/result/result.dart`

**Purpose:** Type-safe error handling without exceptions

**Usage:**
```dart
// Return Result
Future<Result<User>> getUser(String id) async {
  try {
    final user = await api.fetchUser(id);
    return Success(user);
  } catch (e) {
    return Failure('Error: ${e.toString()}');
  }
}

// Handle Result
final result = await getUser('123');
result.when(
  success: (user) => print('Got user: ${user.name}'),
  failure: (error) => print('Error: $error'),
);

// Or use pattern matching
final message = switch (result) {
  Success(data: final user) => 'Hello ${user.name}',
  Failure(message: final msg) => 'Error: $msg',
};
```

---

### 5. **Mixin Pattern** 🆕 (New)
**Location:** `lib/common/mixins/horizontal_scroll_mixin.dart`

**Purpose:** Share scroll behavior across widgets

**Usage:**
```dart
class _MyWidgetState extends State<MyWidget> 
    with HorizontalScrollMixin<MyWidget> {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController, // From mixin
      child: // content
    );
  }
  
  void onButtonPress() {
    scrollLeft(); // From mixin
  }
}
```

---

### 6. **Extension Methods** 🆕 (New)
**Location:** `lib/domain/entities/extensions/`

**Purpose:** Add functionality to existing types without inheritance

**Usage:**
```dart
// Define extension
extension TeamMemberExtensions on TeamMember {
  ServiceCardEntity toServiceCard(BuildContext context) {
    return ServiceCardEntity.teamMember(
      image: imageUrl,
      title: name,
      description: title,
      onTap: () => navigateToDetails(context),
    );
  }
}

// Use extension
final teamMember = TeamMember(...);
final card = teamMember.toServiceCard(context);

// List extension
final cards = teamMembers.toServiceCards(context);
```

---

### 7. **Use Case Pattern** 🆕 (New)
**Location:** `lib/domain/usecases/`

**Purpose:** Encapsulate single business operations

**Usage:**
```dart
class GetAllTeamMembers {
  final TeamRepository _repository;
  
  GetAllTeamMembers(this._repository);
  
  Future<Result<List<TeamMember>>> call() async {
    return await _repository.getAllTeamMembers();
  }
}

// Usage
final useCase = GetAllTeamMembers(repository);
final result = await useCase();
```

---

### 8. **MVVM Pattern** ✅ (Enhanced)
**Location:** `lib/presentation/viewmodel/`

**Purpose:** Separate UI from business logic

**Usage:**
```dart
class TeamViewModel extends BaseViewModel {
  List<TeamMember> _members = [];
  List<TeamMember> get members => _members;
  
  Future<void> loadMembers() async {
    await executeAsync(() async {
      final result = await getAllTeamMembers();
      result.when(
        success: (data) {
          _members = data;
          notifyListeners();
        },
        failure: (error) => setError(error),
      );
    });
  }
}

// In widget
ChangeNotifierProvider(
  create: (_) => sl<TeamViewModel>()..loadMembers(),
  child: Consumer<TeamViewModel>(
    builder: (context, viewModel, _) {
      if (viewModel.isLoading) return LoadingWidget();
      return ListView(children: viewModel.members.map(...));
    },
  ),
)
```

---

### 9. **Dependency Injection** ✅ (Enhanced)
**Location:** `lib/di/modules/injection_container.dart`

**Purpose:** Manage dependencies and improve testability

**Usage:**
```dart
// Register dependencies
sl.registerLazySingleton<TeamRepository>(
  () => TeamRepositoryImpl(),
);

sl.registerFactory(
  () => TeamViewModel(
    getAllTeamMembers: sl<GetAllTeamMembers>(),
  ),
);

// Use in widget
final viewModel = sl<TeamViewModel>();
```

---

## 🏗️ Architecture Layers

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (UI, Widgets, ViewModels, State)      │
│                                         │
│  - pages/                               │
│  - sections/                            │
│  - widgets/                             │
│  - viewmodel/                           │
└─────────────────────────────────────────┘
              ↓ depends on
┌─────────────────────────────────────────┐
│          Domain Layer                   │
│  (Entities, Use Cases, Repositories)    │
│                                         │
│  - entities/                            │
│  - usecases/                            │
│  - repositories/ (interfaces)           │
└─────────────────────────────────────────┘
              ↓ depends on
┌─────────────────────────────────────────┐
│           Data Layer                    │
│  (Repository Impl, Data Sources)        │
│                                         │
│  - repositories/ (implementations)      │
│  - datasources/                         │
│  - models/                              │
│  - dto/                                 │
└─────────────────────────────────────────┘
```

---

## 📋 Common Code Patterns

### Pattern 1: Fetching Data with ViewModel

```dart
// 1. Create Use Case
class GetAllItems {
  final ItemRepository repository;
  GetAllItems(this.repository);
  
  Future<Result<List<Item>>> call() async {
    return await repository.getAllItems();
  }
}

// 2. Create ViewModel
class ItemViewModel extends BaseViewModel {
  final GetAllItems _getAllItems;
  
  List<Item> _items = [];
  List<Item> get items => _items;
  
  ItemViewModel({required GetAllItems getAllItems})
      : _getAllItems = getAllItems;
  
  Future<void> loadItems() async {
    await executeAsync(() async {
      final result = await _getAllItems();
      result.when(
        success: (data) {
          _items = data;
          notifyListeners();
        },
        failure: (error) => setError(error),
      );
    });
  }
}

// 3. Register in DI
sl.registerLazySingleton(() => GetAllItems(sl<ItemRepository>()));
sl.registerFactory(() => ItemViewModel(getAllItems: sl<GetAllItems>()));

// 4. Use in Widget
class ItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<ItemViewModel>()..loadItems(),
      child: Consumer<ItemViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.isLoading) {
            return const CircularProgressIndicator();
          }
          
          if (viewModel.hasError) {
            return Text('Error: ${viewModel.error}');
          }
          
          return ListView.builder(
            itemCount: viewModel.items.length,
            itemBuilder: (context, index) {
              final item = viewModel.items[index];
              return ListTile(title: Text(item.name));
            },
          );
        },
      ),
    );
  }
}
```

---

### Pattern 2: Converting Entities to UI Models

```dart
// 1. Create Extension
extension ItemExtensions on Item {
  ServiceCardEntity toServiceCard(BuildContext context) {
    return ServiceCardEntity.marketing(
      image: imageUrl,
      icon: Icons.star,
      title: name,
      description: description,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ItemDetailsPage(itemId: id),
        ),
      ),
    );
  }
}

// 2. Use Extension
final items = [Item(...), Item(...)];
final cards = items.map((item) => item.toServiceCard(context)).toList();

// 3. Display
GenericServiceSlider(items: cards)
```

---

### Pattern 3: Handling Errors with Result

```dart
// Repository
Future<Result<User>> getUser(String id) async {
  try {
    final response = await api.get('/users/$id');
    final user = User.fromJson(response.data);
    return Success(user);
  } on NetworkException catch (e) {
    return Failure('Network error: ${e.message}');
  } catch (e) {
    return Failure('Unexpected error: ${e.toString()}');
  }
}

// Use Case
Future<Result<User>> call(String id) async {
  if (id.isEmpty) {
    return const Failure('User ID cannot be empty');
  }
  return await repository.getUser(id);
}

// ViewModel
Future<void> loadUser(String id) async {
  setLoading(true);
  final result = await getUser(id);
  
  result.when(
    success: (user) {
      _user = user;
      setLoading(false);
      notifyListeners();
    },
    failure: (error) {
      setError(error);
      setLoading(false);
    },
  );
}
```

---

### Pattern 4: Reusable Widgets with Composition

```dart
// Generic reusable widget
class GenericServiceSlider extends StatefulWidget {
  final List<ServiceCardEntity> items;
  final double scrollOffset;
  
  const GenericServiceSlider({
    required this.items,
    this.scrollOffset = 360.0,
  });
  
  // Implementation...
}

// Use in different sections
class TeamSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericServiceSlider(
      items: teamMembers.toServiceCards(context),
    );
  }
}

class BlogSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericServiceSlider(
      items: blogPosts.toServiceCards(context),
    );
  }
}
```

---

## 🧪 Testing Patterns

### Unit Test Pattern

```dart
void main() {
  late UseCase useCase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    useCase = UseCase(mockRepository);
  });

  group('UseCase', () {
    test('should return success when repository succeeds', () async {
      // Arrange
      when(() => mockRepository.getData())
          .thenAnswer((_) async => Success(testData));

      // Act
      final result = await useCase();

      // Assert
      expect(result, isA<Success>());
      verify(() => mockRepository.getData()).called(1);
    });

    test('should return failure when repository fails', () async {
      // Arrange
      when(() => mockRepository.getData())
          .thenAnswer((_) async => Failure('Error'));

      // Act
      final result = await useCase();

      // Assert
      expect(result, isA<Failure>());
    });
  });
}
```

---

### Widget Test Pattern

```dart
void main() {
  testWidgets('Widget displays correctly', (tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MyWidget(data: testData),
        ),
      ),
    );

    // Assert
    expect(find.text('Expected Text'), findsOneWidget);
    expect(find.byType(ExpectedWidget), findsOneWidget);
  });
}
```

---

## 📊 Code Quality Checklist

### Before Committing Code

- [ ] No code duplication (DRY principle)
- [ ] Single Responsibility - each class has one job
- [ ] Dependency Injection used for all dependencies
- [ ] Result type used for error handling
- [ ] Use Cases created for business logic
- [ ] ViewModels used for state management
- [ ] Extension methods for entity conversions
- [ ] No hardcoded strings (use constants)
- [ ] No commented code
- [ ] Unit tests written for new code
- [ ] Widget tests for new widgets
- [ ] Documentation added for public APIs

---

## 🎯 Quick Wins

### Top 5 Improvements to Make First

1. **Remove Code Duplication** - Use GenericServiceSlider
2. **Add DI for Repositories** - Register all repositories
3. **Create Use Cases** - Extract business logic
4. **Use Result Type** - Replace try-catch with Result
5. **Delete Commented Code** - Clean up main.dart and faq_section.dart

---

## 📚 File Structure Reference

```
lib/
├── common/
│   ├── constants/
│   │   ├── strings.dart          # All app strings
│   │   └── theme/
│   ├── mixins/
│   │   └── horizontal_scroll_mixin.dart
│   └── utils/
├── core/
│   ├── result/
│   │   └── result.dart           # Result type
│   └── errors/
├── data/
│   ├── datasources/
│   ├── dto/
│   ├── mappers/
│   ├── models/
│   └── repositories/             # Implementations
├── di/
│   └── modules/
│       └── injection_container.dart
├── domain/
│   ├── entities/
│   │   └── extensions/           # Extension methods
│   ├── repositories/             # Interfaces
│   └── usecases/
│       ├── team/
│       ├── blog/
│       └── ...
└── presentation/
    ├── state/
    ├── viewmodel/
    └── views/
        ├── pages/
        ├── sections/
        └── widgets/
            └── common/
                ├── generic_service_slider.dart
                └── strategies/
```

---

**Last Updated:** 2026-01-14
**Version:** 1.0
