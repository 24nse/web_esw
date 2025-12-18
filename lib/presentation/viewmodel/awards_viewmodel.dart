import '../../domain/entities/award.dart';
import '../../domain/usecases/get_awards.dart';
import 'base_viewmodel.dart';

/// ViewModel for Awards feature
/// Manages award data and UI state following MVVM pattern
class AwardsViewModel extends BaseViewModel {
  final GetAllAwards _getAllAwards;
  final GetLatestAwards _getLatestAwards;

  List<Award> _awards = [];
  List<Award> _latestAwards = [];
  int _currentIndex = 0;

  AwardsViewModel({
    required GetAllAwards getAllAwards,
    required GetLatestAwards getLatestAwards,
  })  : _getAllAwards = getAllAwards,
        _getLatestAwards = getLatestAwards;

  /// All awards
  List<Award> get awards => _awards;

  /// Latest awards (for carousel)
  List<Award> get latestAwards => _latestAwards;

  /// Current selected index in carousel
  int get currentIndex => _currentIndex;

  /// Whether awards have been loaded
  bool get hasAwards => _awards.isNotEmpty;

  /// Total count of awards
  int get awardCount => _awards.length;

  /// Current selected award
  Award? get currentAward {
    if (_awards.isEmpty || _currentIndex >= _awards.length) return null;
    return _awards[_currentIndex];
  }

  /// Sets the current carousel index
  void setCurrentIndex(int index) {
    if (index >= 0 && index < _awards.length) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  /// Navigates to next award
  void nextAward() {
    if (_currentIndex < _awards.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  /// Navigates to previous award
  void previousAward() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  /// Loads all awards
  Future<void> loadAwards() async {
    final result = await executeAsync(() => _getAllAwards());
    if (result != null) {
      _awards = result;
      _currentIndex = 0;
      notifyListeners();
    }
  }

  /// Loads latest awards
  Future<void> loadLatestAwards({int limit = 4}) async {
    final result = await executeAsync(
      () => _getLatestAwards(limit: limit),
    );
    if (result != null) {
      _latestAwards = result;
      notifyListeners();
    }
  }

  /// Refreshes all award data
  Future<void> refresh() async {
    await loadAwards();
    await loadLatestAwards();
  }

  /// Gets awards by year
  List<Award> getAwardsByYear(String year) {
    return _awards.where((a) => a.year == year).toList();
  }

  /// Gets available years
  List<String> get availableYears {
    return _awards.map((a) => a.year).toSet().toList()..sort((a, b) => b.compareTo(a));
  }
}
