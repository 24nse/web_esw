import 'package:flutter/material.dart';
import 'package:web_site/core/app_styles.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';
import '../../../../domain/entities/blog_category.dart';

class SidebarCategories extends StatelessWidget {
  final List<BlogCategory> categories;
  final ValueChanged<BlogCategory>? onCategoryTap;

  const SidebarCategories({
    super.key,
    required this.categories,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'التصنيفات الشائعة',
            style: AppStyles.styleBold20(context).copyWith(
              color: const Color(0xFF0A2463),
            ),
          ),
          const SizedBox(height: 20),
          
          // Categories List
          ...categories.map((category) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () => onCategoryTap?.call(category),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey[200]!,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    AppText(
                      category.icon,
                      style: AppStyles.styleRegular18(context),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppText(
                        category.name,
                        style: AppStyles.styleMedium16(context).copyWith(
                          fontSize: getResponsiveFontSize(context, fontSize: 14),
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
