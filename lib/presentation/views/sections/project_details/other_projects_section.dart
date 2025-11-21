import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../../../domain/entities/project_details.dart';
import '../../widgets/project_details/project_card_widget.dart';

class OtherProjectsSection extends StatelessWidget {
  final List<RelatedProject> projects;

  const OtherProjectsSection({
    super.key,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      children: [
        // Divider with label
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: AppColors.border,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'المشاريع',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: AppColors.border,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        
        // Main Heading
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'شاهد ',
                style: TextStyle(color: AppColors.primaryDark),
              ),
              TextSpan(
                text: 'مشاريع أخرى',
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        
        // Project Cards
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (projects.isNotEmpty)
              Expanded(
                child: ProjectCardWidget(
                  title: projects[0].title,
                  imageUrl: projects[0].imageUrl,
                  tags: projects[0].tags,
                ),
              ),
            if (projects.length > 1) ...[
              const SizedBox(width: 24),
              Expanded(
                child: ProjectCardWidget(
                  title: projects[1].title,
                  imageUrl: projects[1].imageUrl,
                  tags: projects[1].tags,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
