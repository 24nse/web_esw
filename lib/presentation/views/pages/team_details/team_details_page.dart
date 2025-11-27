import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/data/repositories/team_repository_impl.dart';
import 'package:web_site/domain/entities/team_member.dart';
import 'package:web_site/domain/usecases/get_team_member_details.dart';
import 'package:web_site/presentation/views/sections/project_details/footer_section.dart';
import 'package:web_site/presentation/views/sections/team_details/contact_form_section.dart';
import 'package:web_site/presentation/views/sections/team_details/profile_card_section.dart';
import 'package:web_site/presentation/views/sections/team_details/skills_section.dart';
import 'package:web_site/presentation/views/widgets/common/page_hero_section.dart';

/// Team Details page displaying team member profile, skills, and contact form
class TeamDetailsPage extends StatefulWidget {
  final String memberId;

  const TeamDetailsPage({
    super.key,
    required this.memberId,
  });

  @override
  State<TeamDetailsPage> createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  late final GetTeamMemberDetails _getTeamMemberDetails;
  TeamMember? _member;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _getTeamMemberDetails = GetTeamMemberDetails(TeamRepositoryImpl());
    _loadTeamMember();
  }

  Future<void> _loadTeamMember() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final member = await _getTeamMemberDetails(widget.memberId);

      setState(() {
        _member = member;
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
                : _member == null
                    ? const Center(child: Text('Member not found'))
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            // Page header with breadcrumb
                            PageHeroSection(
                              title: 'Team Details',
                              breadcrumbItems: const [
                                BreadcrumbItem(label: 'Home', ),
                                BreadcrumbItem(label: 'Team Details'),
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
                                      // Profile Card
                                      ProfileCardSection(member: _member!),
                                      const SizedBox(height: 48),

                                      // Professional Skills
                                      SkillsSection(skills: _member!.skills),
                                      const SizedBox(height: 48),

                                      // Contact Form
                                      const ContactFormSection(),
                                      const SizedBox(height: 48),
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
