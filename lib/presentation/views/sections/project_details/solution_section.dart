import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../../../domain/entities/project_details.dart';
import '../../widgets/project_details/icon_text_card.dart';

class SolutionSection extends StatelessWidget {
  final String title;
  final String description;
  final List<SolutionPoint> points;

  const SolutionSection({
    super.key,
    required this.title,
    required this.description,
    required this.points,
  });

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'check':
        return Icons.check_circle;
      case 'settings':
        return Icons.settings;
      case 'eco':
        return Icons.eco;
      default:
        return Icons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: textTheme.headlineLarge?.copyWith(
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 16),
        
        // Description
        Text(
          description,
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.textMuted,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 32),
        
        // 3 Key Points
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: points.map((point) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: IconTextCard(
                  icon: _getIconData(point.icon),
                  title: point.title,
                  description: point.description,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
