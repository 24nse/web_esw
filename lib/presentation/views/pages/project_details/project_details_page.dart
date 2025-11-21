import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../../../data/repositories/project_details_repository_impl.dart';
import '../../../../domain/entities/project_details.dart';
import '../../../../domain/repositories/project_details_repository.dart';
import '../../../../domain/usecases/get_project_details.dart';
import '../../sections/landing/footer_section.dart';
import '../../sections/project_details/challenge_section.dart';
import '../../sections/project_details/cta_section.dart';
import '../../sections/project_details/gallery_section.dart';
import '../../sections/project_details/hero_image_section.dart';
import '../../sections/project_details/other_projects_section.dart';
import '../../sections/project_details/page_header_section.dart';
import '../../sections/project_details/project_overview_section.dart';
import '../../sections/project_details/result_section.dart';
import '../../sections/project_details/scope_section.dart';
import '../../sections/project_details/solution_section.dart';
import '../../sections/project_details/testimonial_section.dart';


class ProjectDetailsPage extends StatefulWidget {
  final String projectId;

  const ProjectDetailsPage({
    super.key,
    this.projectId = '1',
  });

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  late final GetProjectDetails _getProjectDetails;
  ProjectDetails? _projectDetails;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Initialize use case with repository
    final ProjectDetailsRepository repository = ProjectDetailsRepositoryImpl();
    _getProjectDetails = GetProjectDetails(repository);
    _loadProjectDetails();
  }

  Future<void> _loadProjectDetails() async {
    try {
      final details = await _getProjectDetails(widget.projectId);
      setState(() {
        _projectDetails = details;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgG,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _projectDetails == null
              ? const Center(child: Text('Project not found'))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      // Section 1: Header
                      const PageHeaderSection(),
                      
                      // Main Content - Centered with max width
                      Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 48,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Section 2: Hero Image
                                HeroImageSection(
                                  imageUrl: _projectDetails!.heroImageUrl,
                                ),
                                const SizedBox(height: 32),
                                
                                // Section 3: Project Overview
                                ProjectOverviewSection(
                                  title: _projectDetails!.title,
                                  description: _projectDetails!.description,
                                  category: _projectDetails!.category,
                                  location: _projectDetails!.location,
                                  totalArea: _projectDetails!.totalArea,
                                  year: _projectDetails!.year,
                                ),
                                const SizedBox(height: 48),
                                
                                // Section 4: The Challenge
                                ChallengeSection(
                                  title: _projectDetails!.challengeTitle,
                                  description: _projectDetails!.challengeDescription,
                                ),
                                const SizedBox(height: 48),
                                
                                // Section 5: The Solution
                                SolutionSection(
                                  title: _projectDetails!.solutionTitle,
                                  description: _projectDetails!.solutionDescription,
                                  points: _projectDetails!.solutionPoints,
                                ),
                                const SizedBox(height: 48),
                                
                                // Section 6: Gallery
                                GallerySection(
                                  imageUrls: _projectDetails!.galleryImages,
                                ),
                                const SizedBox(height: 48),
                                
                                // Section 7: Scope of Work
                                ScopeSection(
                                  title: _projectDetails!.scopeTitle,
                                  description: _projectDetails!.scopeDescription,
                                  items: _projectDetails!.scopeItems,
                                ),
                                const SizedBox(height: 48),
                                
                                // Section 8: The Result
                                ResultSection(
                                  title: _projectDetails!.resultTitle,
                                  description: _projectDetails!.resultDescription,
                                ),
                                const SizedBox(height: 48),
                                
                                // Section 9: Testimonial
                                TestimonialSection(
                                  testimonial: _projectDetails!.testimonial,
                                ),
                                const SizedBox(height: 48),
                                
                                // Section 10: CTA
                                const CtaSection(),
                                const SizedBox(height: 64),
                                
                                // Section 11: Other Projects
                                OtherProjectsSection(
                                  projects: _projectDetails!.relatedProjects,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      // Section 12: Footer (Full Width)
                      //const FooterSection(),
                    ],
                  ),
                ),
    );
  }
}
