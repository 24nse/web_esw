import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

/// Custom skill indicator widget that displays a skill name, percentage, and progress bar
class SkillIndicator extends StatelessWidget {
  final String skillName;
  final int percentage;

  const SkillIndicator({
    super.key,
    required this.skillName,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Skill name and percentage row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skillName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),
            Text(
              '$percentage%',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        // Custom progress bar
        // Custom progress bar
        LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: 8,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Background track
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.bgG,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  
                  // Filled portion
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: FractionallySizedBox(
                      widthFactor: percentage / 100,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  
                  // Thumb indicator at the end
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    start: (constraints.maxWidth * (percentage / 100)) - 6,
                    top: -2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary,
                          width: 2.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
