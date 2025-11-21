import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

class PageHeaderSection extends StatelessWidget {
  const PageHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    
    return Column(
      children: [
        // Header container
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40),
          color: AppColors.bgG,
          child: Center(
            child: Column(
              children: [
                // Main Title
                Text(
                  'تفاصيل المشروع',
                  style: textTheme.displaySmall?.copyWith(
                    color: AppColors.primaryDark,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Breadcrumb
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'الرئيسية',
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '/',
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ),
                    Text(
                      'تفاصيل المشروع',
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        
        // Decorative blue bar
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            // Simple pattern using gradient
            gradient: LinearGradient(
              colors: [
                AppColors.primaryDark,
                AppColors.primaryDark.withValues(alpha: 0.8),
                AppColors.primaryDark,
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
      ],
    );
  }
}
