import '../../core/result/result.dart';
import '../entities/team_member.dart';
import '../repositories/team_repository.dart';

/// Use case for fetching featured team members
/// 
/// This encapsulates the business logic for determining which
/// team members should be featured on the homepage or other sections.
/// 
/// Usage:
/// ```dart
/// final useCase = GetFeaturedTeamMembers(repository);
/// final result = await useCase(limit: 3);
/// ```
class GetFeaturedTeamMembers {
  final TeamRepository _repository;

  GetFeaturedTeamMembers(this._repository);

  /// Executes the use case
  /// 
  /// Parameters:
  /// - [limit]: Maximum number of featured members to return (default: 3)
  /// 
  /// Returns Result<List<TeamMember>> containing either:
  /// - Success with list of featured team members
  /// - Failure with error message
  Future<Result<List<TeamMember>>> call({int limit = 3}) async {
    if (limit <= 0) {
      return const Failure('Limit must be greater than 0');
    }
    
    return await _repository.getFeaturedTeamMembers(limit: limit);
  }
}
