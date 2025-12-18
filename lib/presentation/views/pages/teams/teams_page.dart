import 'package:flutter/material.dart';
import 'package:web_site/data/repositories/team_repository_impl.dart';
import 'package:web_site/domain/entities/team_member.dart';
import 'package:web_site/domain/usecases/get_all_team_members.dart';
import '../base/base_page.dart';
import '../../widgets/common/page_hero_section.dart';
import '../../widgets/team/team_member_card.dart';

/// Teams page displaying all team members
/// Uses BasePage template with loading/error state handling
class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> with BasePageStateMixin {
  late final GetAllTeamMembers _getAllTeamMembers;
  List<TeamMember> _members = [];

  @override
  void initState() {
    super.initState();
    _getAllTeamMembers = GetAllTeamMembers(TeamRepositoryImpl());
    _loadTeamMembers();
  }

  Future<void> _loadTeamMembers() async {
    final result = await executeAsync(() => _getAllTeamMembers());
    if (result != null) {
      setState(() => _members = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'الفريق',
      breadcrumbItems: const [
        BreadcrumbItem(label: 'الرئيسية'),
        BreadcrumbItem(label: 'الفريق', isActive: true),
      ],
      isLoading: isLoading,
      error: error,
      onRetry: _loadTeamMembers,
      children: [
        Center(
          child: Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: _members.map((member) {
              return TeamMemberCard(member: member);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
