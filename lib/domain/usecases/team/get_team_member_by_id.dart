import '../../core/result/result.dart';
import '../entities/team_member.dart';
import '../repositories/team_repository.dart';

/// Use case for fetching a specific team member by ID
/// 
/// This follows the Single Responsibility Principle by handling
/// a single business operation.
/// 
/// Usage:
/// ```dart
/// final useCase = GetTeamMemberById(repository);
/// final result = await useCase('123');
/// result.when(
///   success: (member) => print('Got member: ${member.name}'),
///   failure: (error) => print('Error: $error'),
/// );
/// ```
class GetTeamMemberById {
  final TeamRepository _repository;

  GetTeamMemberById(this._repository);

  /// Executes the use case
  /// 
  /// Parameters:
  /// - [id]: The unique identifier of the team member
  /// 
  /// Returns Result<TeamMember> containing either:
  /// - Success with the team member
  /// - Failure with error message if not found
  Future<Result<TeamMember>> call(String id) async {
    if (id.isEmpty) {
      return const Failure('Team member ID cannot be empty');
    }
    
    return await _repository.getTeamMemberById(id);
  }
}
