import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/domain/entities/team_member.dart';
import 'package:web_site/presentation/views/widgets/team/skill_indicator.dart';

/// Professional skills section with responsive grid layout
class SkillsSection extends StatelessWidget {
  final List<ProfessionalSkill> skills;

  const SkillsSection({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
         Text(
          'المهارات المهنية',
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 12),

        // Description
         Text(
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التي يولدها التطبيق.',
          style: textTheme.bodyMedium?.copyWith(
            height: 1.6,
            color: AppColors.gray,
          ),
        ),
        const SizedBox(height: 32),

        // Skills grid
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 700;

            if (isWide) {
              // Two column layout for desktop
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left column
                  Expanded(
                    child: _buildSkillColumn(skills.take(3).toList()),
                  ),
                  const SizedBox(width: 32),

                  // Right column
                  Expanded(
                    child: _buildSkillColumn(skills.skip(3).take(3).toList()),
                  ),
                ],
              );
            } else {
              // Single column layout for mobile
              return _buildSkillColumn(skills);
            }
          },
        ),
      ],
    );
  }

  Widget _buildSkillColumn(List<ProfessionalSkill> columnSkills) {
    return Column(
      children: columnSkills.map((skill) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: SkillIndicator(
            skillName: skill.name,
            percentage: skill.percentage,
          ),
        );
      }).toList(),
    );
  }
}
