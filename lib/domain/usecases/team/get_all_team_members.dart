import '../../core/result/result.dart';
import '../entities/team_member.dart';
import '../repositories/team_repository.dart';

/// Use case for fetching all team members
/// 
/// This follows the Single Responsibility Principle by encapsulating
/// a single business operation. It also follows the Dependency Inversion
/// Principle by depending on the abstract TeamRepository.
/// 
/// Benefits:
/// - Testability: Easy to mock repository
/// - Reusability: Can be used across different UI components
/// - Maintainability: Business logic in one place
/// - Clean Architecture: Domain layer independent of data layer
/// 
/// Usage:
/// ```dart
/// final useCase = GetAllTeamMembers(repository);
/// final result = await useCase();
/// result.when(
///   success: (members) => print('Got ${members.length} members'),
///   failure: (error) => print('Error: $error'),
/// );
/// ```
class GetAllTeamMembers {
  final TeamRepository _repository;

  GetAllTeamMembers(this._repository);

  /// Executes the use case
  /// 
  /// Returns Result<List<TeamMember>> containing either:
  /// - Success with list of all team members
  /// - Failure with error message
  Future<Result<List<TeamMember>>> call() async {
    return await _repository.getAllTeamMembers();
  }
}
