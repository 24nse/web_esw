import '../entities/team_member.dart';

abstract class TeamRepository {
  Future<TeamMember> getTeamMemberById(String id);
  Future<List<TeamMember>> getAllTeamMembers();
}
