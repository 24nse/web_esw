import '../entities/team_member.dart';
import '../repositories/team_repository.dart';

class GetTeamMemberDetails {
  final TeamRepository repository;

  const GetTeamMemberDetails(this.repository);

  Future<TeamMember> call(String id) {
    return repository.getTeamMemberById(id);
  }
}
