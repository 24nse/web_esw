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
        return Icons.check;
      case 'settings':
        return Icons.check;
      case 'eco':
        return Icons.check;
      default:
        return Icons.check;
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
        GridView.count(

          mainAxisSpacing: 1,       // المسافة بين الصفوف (قللها كما تريد)
          crossAxisSpacing: 1,
          childAspectRatio: 5,// المسافة بين الأعمدة (اختياري)
          crossAxisCount: 4,                 // عدد العناصر في كل صف
          shrinkWrap: true,                  // عشان ياخذ الارتفاع اللي يحتاجه فقط
          children: points.map((point) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: IconTextRowCard(
                icon: _getIconData(point.icon),
                title: point.title,
                description: point.description,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
