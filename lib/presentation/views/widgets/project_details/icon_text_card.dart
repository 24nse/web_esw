import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

class IconTextCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const IconTextCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Orange circular icon
        Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
        ),
        const SizedBox(height: 16),
        
        // Title
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 8),
        
        // Description
        Text(
          description,
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.textMuted,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
