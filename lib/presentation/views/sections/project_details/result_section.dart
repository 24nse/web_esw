import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

class ResultSection extends StatelessWidget {
  final String title;
  final String description;

  const ResultSection({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.headlineLarge?.copyWith(
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 16),
        
        Text(
          description,
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.textMuted,
            height: 1.8,
          ),
        ),
      ],
    );
  }
}
