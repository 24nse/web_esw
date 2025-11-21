import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../graphics/unified_ruler_ticks_painter.dart';

/// Reusable page hero section with customizable title and breadcrumb
class PageHeroSection extends StatelessWidget {
  final String title;
  final List<BreadcrumbItem> breadcrumbItems;
  final Color? backgroundColor;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final double? verticalPadding;
  final double? maxWidth;

  const PageHeroSection({
    super.key,
    required this.title,
    required this.breadcrumbItems,
    this.backgroundColor,
    this.gradientStartColor,
    this.gradientEndColor,
    this.verticalPadding,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      children: [
        CustomPaint(
          foregroundPainter: UnifiedRulerTicksPainter(
            drawBottom: false,
            // أعلى أفقي
            drawTop: true,
            topMode: UnifiedRulerTicksMode.horizontal,
            topStep: 10,
            topPatternHeights: const [14, 6, 10, 6, 14],
            topMargin: 0,
            topStrokeWidth: 1,
            topColor: const Color(0xFFD1D5DB),
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 64,
              horizontal: 24,
            ),
            color: backgroundColor ?? AppColors.bgG,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth ?? 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title
                    Text(
                      title,
                      style: textTheme.displaySmall?.copyWith(
                        color: const Color(0xFF0A1E4D),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Breadcrumb
                    _buildBreadcrumb(textTheme),
                  ],
                ),
              ),
            ),
          ),
        ),
        
        // Decorative gradient bar with diagonal pattern
        SizedBox(
          height: 30,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      gradientStartColor ?? const Color(0xFF001E62),
                      gradientEndColor ?? const Color(0xFF0A2F78),
                    ],
                  ),
                ),
              ),
              CustomPaint(
                foregroundPainter: UnifiedRulerTicksPainter(
                  drawTop: false,
                  // أسفل مائل
                  drawBottom: true,
                  bottomMode: UnifiedRulerTicksMode.diagonal,
                  bottomStep: 12,
                  bottomPatternHeights: const [10],
                  bottomAngleDeg: 60,
                  bottomDirection: DiagonalDirection.downLeft,
                  bottomMargin: 0,
                  bottomStrokeWidth: 1,
                  bottomColor: const Color(0xFF5F83C8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBreadcrumb(TextTheme textTheme) {
    if (breadcrumbItems.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<Widget> children = [];
    
    for (int i = 0; i < breadcrumbItems.length; i++) {
      final item = breadcrumbItems[i];
      
      // Add breadcrumb text
      children.add(
        Text(
          item.label,
          style: textTheme.bodyMedium?.copyWith(
            color: item.isActive ? AppColors.primary : AppColors.textMuted,
            fontWeight: item.isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      );
      
      // Add separator if not last item
      if (i < breadcrumbItems.length - 1) {
        children.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '/',
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ),
        );
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}

/// Breadcrumb item model
class BreadcrumbItem {
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const BreadcrumbItem({
    required this.label,
    this.isActive = false,
    this.onTap,
  });
}
