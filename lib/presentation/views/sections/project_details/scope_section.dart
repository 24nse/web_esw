import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../../../domain/entities/project_details.dart';
import '../../widgets/project_details/icon_text_card.dart';

class ScopeSection extends StatelessWidget {
  final String title;
  final String description;
  final List<ScopeItem> items;

  const ScopeSection({
    super.key,
    required this.title,
    required this.description,
    required this.items,
  });

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'design_services':
        return Icons.design_services;
      case 'handyman':
        return Icons.handyman;
      case 'verified':
        return Icons.verified;
      case 'engineering':
        return Icons.engineering;
      default:
        return Icons.work;
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
        
        // 4 Scope Items
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: IconTextCard(
                  icon: _getIconData(item.icon),
                  title: item.title,
                  description: item.description,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
