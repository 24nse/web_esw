import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/core/app_styles.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final List<String> features;
  final bool highlighted;
  final VoidCallback? onAction;
  final String actionLabel;

  const PlanCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.features,
    this.highlighted = false,
    this.onAction,
    this.actionLabel = 'اطلب عرض سعر',
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleColor = highlighted ? Colors.white : AppColors.text;
    final bodyColor = highlighted ? Colors.white70 : AppColors.textMuted;

    return Container(
      decoration: BoxDecoration(
        color: highlighted ? AppColors.primary : AppColors.surface,
        borderRadius: AppRadii.lg,
        border: Border.all(color: highlighted ? Colors.transparent : AppColors.border),
        boxShadow: AppShadows.card,
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title,
            useFittedBox: true,
            alignment: Alignment.centerRight,
            style: AppStyles.styleBold20(context).copyWith(
              color: titleColor,
            ),
          ),
          const SizedBox(height: 8),
          AppText(
            description,
            style: AppStyles.styleRegular14(context).copyWith(color: bodyColor),
          ),
          const SizedBox(height: 16),
          AppText(
            price,
            useFittedBox: true,
            alignment: Alignment.centerRight,
            style: AppStyles.styleBold24(context).copyWith(
              color: titleColor,
            ),
          ),
          const SizedBox(height: 16),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 18,
                    color: highlighted ? Colors.white : AppColors.success,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppText(
                      feature,
                      style: AppStyles.styleRegular14(context).copyWith(
                        color: highlighted ? Colors.white : AppColors.text,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: onAction,
            style: ElevatedButton.styleFrom(
              backgroundColor: highlighted ? Colors.white : AppColors.primary,
              foregroundColor: highlighted ? AppColors.primary : Colors.white,
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
            ),
            child: AppText(
              actionLabel,
              style: AppStyles.styleSemiBold14(context).copyWith(
                color: highlighted ? AppColors.primary : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
