import 'package:web_site/domain/entities/team_member.dart';
import 'package:web_site/domain/usecases/team/get_all_team_members.dart';
import 'package:web_site/domain/usecases/team/get_featured_team_members.dart';
import 'package:web_site/presentation/viewmodel/base_viewmodel.dart';

/// ViewModel for Team-related operations
/// 
/// This follows MVVM pattern and manages the state for team member displays.
/// It uses the Result type for type-safe error handling and provides
/// reactive state updates through ChangeNotifier.
/// 
/// Benefits:
/// - Separation of Concerns: UI logic separated from business logic
/// - Testability: Easy to unit test without UI dependencies
/// - Reusability: Can be used across multiple team-related screens
/// - State Management: Centralized state for team data
/// 
/// Usage with Provider:
/// ```dart
/// ChangeNotifierProvider(
///   create: (_) => sl<TeamViewModel>()..loadAllTeamMembers(),
///   child: Consumer<TeamViewModel>(
///     builder: (context, viewModel, _) {
///       // Use viewModel.teamMembers, viewModel.isLoading, etc.
///     },
///   ),
/// )
/// ```
class TeamViewModel extends BaseViewModel {
  final GetAllTeamMembers _getAllTeamMembers;
  final GetFeaturedTeamMembers _getFeaturedTeamMembers;

  TeamViewModel({
    required GetAllTeamMembers getAllTeamMembers,
    required GetFeaturedTeamMembers getFeaturedTeamMembers,
  })  : _getAllTeamMembers = getAllTeamMembers,
        _getFeaturedTeamMembers = getFeaturedTeamMembers;

  // State
  List<TeamMember> _teamMembers = [];
  List<TeamMember> _featuredMembers = [];
  TeamMember? _selectedMember;

  // Getters
  List<TeamMember> get teamMembers => _teamMembers;
  List<TeamMember> get featuredMembers => _featuredMembers;
  TeamMember? get selectedMember => _selectedMember;
  
  bool get hasTeamMembers => _teamMembers.isNotEmpty;
  bool get hasFeaturedMembers => _featuredMembers.isNotEmpty;
  int get teamMembersCount => _teamMembers.length;

  /// Loads all team members
  Future<void> loadAllTeamMembers() async {
    await executeAsync(() async {
      final result = await _getAllTeamMembers();
      
      result.when(
        success: (members) {
          _teamMembers = members;
          notifyListeners();
        },
        failure: (message) {
          setError(message);
        },
      );
    });
  }

  /// Loads featured team members for homepage
  Future<void> loadFeaturedTeamMembers({int limit = 3}) async {
    await executeAsync(() async {
      final result = await _getFeaturedTeamMembers(limit: limit);
      
      result.when(
        success: (members) {
          _featuredMembers = members;
          notifyListeners();
        },
        failure: (message) {
          setError(message);
        },
      );
    });
  }

  /// Selects a team member (for detail view)
  void selectMember(TeamMember member) {
    _selectedMember = member;
    notifyListeners();
  }

  /// Clears the selected member
  void clearSelection() {
    _selectedMember = null;
    notifyListeners();
  }

  /// Refreshes team data
  Future<void> refresh() async {
    await loadAllTeamMembers();
  }

  /// Searches team members by name or title
  List<TeamMember> searchMembers(String query) {
    if (query.isEmpty) return _teamMembers;
    
    final lowerQuery = query.toLowerCase();
    return _teamMembers.where((member) {
      return member.name.toLowerCase().contains(lowerQuery) ||
             member.title.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  /// Filters team members by title/role
  List<TeamMember> filterByTitle(String title) {
    return _teamMembers.where((member) {
      return member.title.toLowerCase().contains(title.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    _teamMembers = [];
    _featuredMembers = [];
    _selectedMember = null;
    super.dispose();
  }
}
