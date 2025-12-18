import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/common/utils/responsive_helper.dart';
import '../common/title_section.dart';

/// Base section template providing consistent layout across all sections
/// Includes: Title Section (optional), Content with padding and constraints
///
/// Usage:
/// ```dart
/// BaseSection(
///   sectionTitle: 'Section Title',
///   titleDescription1: 'First line of description',
///   titleDescription2: 'Second line (colored)',
///   backgroundColor: AppColors.bgW,
///   children: [
///     // Your section content here
///   ],
/// )
/// ```
class BaseSection extends StatelessWidget {
  /// Section title (for TitleSection)
  final String? sectionTitle;

  /// First line of title description
  final String? titleDescription1;

  /// Second line of title description (with accent color)
  final String? titleDescription2;

  /// Color for first description line
  final Color? titleColor1;

  /// Color for second description line
  final Color? titleColor2;

  /// Content widgets to display
  final List<Widget> children;

  /// Background color for the section
  final Color backgroundColor;

  /// Whether to constrain content width
  final bool constrainContent;

  /// Maximum content width (default: dynamic based on device)
  final double? maxWidth;

  /// Vertical padding (default: dynamic based on device)
  final double? verticalPadding;

  /// Horizontal padding (default: dynamic based on device)
  final double? horizontalPadding;

  /// Spacing after title section
  final double titleSpacing;

  /// Whether the section uses full width (no constraints)
  final bool fullWidth;

  /// Custom title widget (overrides TitleSection)
  final Widget? customTitle;

  const BaseSection({
    super.key,
    this.sectionTitle,
    this.titleDescription1,
    this.titleDescription2,
    this.titleColor1,
    this.titleColor2,
    required this.children,
    this.backgroundColor = AppColors.bgW,
    this.constrainContent = true,
    this.maxWidth = 1100,
    this.verticalPadding = 60,
    this.horizontalPadding = 24,
    this.titleSpacing = 40,
    this.fullWidth = false,
    this.customTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ??
            ResponsiveHelper.valueByDevice(
              context,
              mobile: 40.0,
              tablet: 50.0,
              desktop: 60.0,
            ),
      ),
      color: backgroundColor,
      child: Column(
        children: [
          // Title Section
          if (sectionTitle != null || customTitle != null) ...[
            customTitle ??
                TitleSection(
                  title: sectionTitle!,
                  des1: titleDescription1,
                  des2: titleDescription2,
                  colordse1: titleColor1,
                  colordse2: titleColor2,
                ),
            SizedBox(height: titleSpacing),
          ],

          // Content
          if (fullWidth)
            Column(children: children)
          else if (constrainContent)
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: maxWidth ?? ResponsiveHelper.getMaxWidth(context),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding ??
                        ResponsiveHelper.getHorizontalPadding(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: children,
                  ),
                ),
              ),
            )
          else
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding ??
                    ResponsiveHelper.getHorizontalPadding(context),
              ),
              child: Column(children: children),
            ),
        ],
      ),
    );
  }
}

/// Section with dark background theme
class DarkSection extends BaseSection {
  const DarkSection({
    super.key,
    super.sectionTitle,
    super.titleDescription1,
    super.titleDescription2,
    required super.children,
    super.maxWidth,
    super.verticalPadding,
    super.horizontalPadding,
    super.titleSpacing,
    super.fullWidth,
    super.customTitle,
    super.constrainContent,
    required Color titleColor1,
  }) : super(
          backgroundColor: AppColors.primaryDark,
          titleColor1: Colors.white,
          titleColor2: AppColors.primary,
        );
}

/// Section with light gray background theme
class LightSection extends BaseSection {
  const LightSection({
    super.key,
    super.sectionTitle,
    super.titleDescription1,
    super.titleDescription2,
    required super.children,
    super.maxWidth,
    super.verticalPadding,
    super.horizontalPadding,
    super.titleSpacing,
    super.fullWidth,
    super.customTitle,
    super.constrainContent, Color? backgroundColor,
  }) : super(
          backgroundColor: AppColors.bgG,
          titleColor1: AppColors.primaryDark,
          titleColor2: AppColors.primary,
        );
}

/// Section with white background theme
class WhiteSection extends BaseSection {
  const WhiteSection({
    super.key,
    super.sectionTitle,
    super.titleDescription1,
    super.titleDescription2,
    required super.children,
    super.maxWidth,
    super.verticalPadding,
    super.horizontalPadding,
    super.titleSpacing,
    super.fullWidth,
    super.customTitle,
    super.constrainContent,
  }) : super(
          backgroundColor: AppColors.bgW,
          titleColor1: AppColors.primaryDark,
          titleColor2: AppColors.primary,
        );
}
