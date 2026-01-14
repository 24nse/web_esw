import '../entities/team_member.dart';
import '../../core/result/result.dart';

/// Repository interface for Team operations
/// 
/// This follows the Repository Pattern and Dependency Inversion Principle.
/// The domain layer defines the contract, and the data layer implements it.
/// 
/// Updated to use Result type for better error handling.
abstract class TeamRepository {
  /// Fetches a team member by their unique ID
  /// 
  /// Returns:
  /// - Success with TeamMember if found
  /// - Failure with error message if not found or error occurs
  Future<Result<TeamMember>> getTeamMemberById(String id);
  
  /// Fetches all team members
  /// 
  /// Returns:
  /// - Success with List<TeamMember> if successful
  /// - Failure with error message if error occurs
  Future<Result<List<TeamMember>>> getAllTeamMembers();
  
  /// Fetches featured team members (optional enhancement)
  /// 
  /// Returns:
  /// - Success with List<TeamMember> containing featured members
  /// - Failure with error message if error occurs
  Future<Result<List<TeamMember>>> getFeaturedTeamMembers({int limit = 3});
}
