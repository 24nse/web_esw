

import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/data/repositories/team_repository_impl.dart';
import 'package:web_site/domain/entities/team_member.dart';
import 'package:web_site/domain/usecases/get_all_team_members.dart';
import 'package:web_site/presentation/views/sections/landing/footer_section.dart';
import 'package:web_site/presentation/views/widgets/common/page_hero_section.dart';
import 'package:web_site/presentation/views/widgets/team/team_member_card.dart';

/// Team Details page displaying team member profile, skills, and contact form
class TeamsPage extends StatefulWidget {

  const TeamsPage({
    super.key,
  });

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  late final GetAllTeamMembers _getAllTeamMembers;
  List<TeamMember> _members = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _getAllTeamMembers = GetAllTeamMembers(TeamRepositoryImpl());
    _loadTeamMembers();
  }

  Future<void> _loadTeamMembers() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final members = await _getAllTeamMembers();

      setState(() {
        _members = members;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgW,
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? Center(child: Text('Error: $_error'))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        // Page header with breadcrumb
                        PageHeroSection(
                          title: 'الفريق',
                          breadcrumbItems: const [
                            BreadcrumbItem(label: 'الرئيسية'),
                            BreadcrumbItem(label: 'الفريق'),
                          ],
                        ),

                        // Main content with max width constraint
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 1100),
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              ),
                            ),
                          ),
                        ),

                        // Footer
                        const FooterSection(),
                      ],
                    ),
                  ),
      ),
    );
  }
}
