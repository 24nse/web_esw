import '../entities/team_member.dart';
import '../repositories/team_repository.dart';

class GetAllTeamMembers {
  final TeamRepository repository;

  GetAllTeamMembers(this.repository);

  Future<List<TeamMember>> call() async {
    return await repository.getAllTeamMembers();
  }
}
