import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/common/utils/responsive_helper.dart';
import '../../sections/landing/footer_section.dart';
import '../../widgets/common/page_hero_section.dart';
import '../../sections/home/header.dart';
import '../../widgets/common/app_drawer.dart';

/// Base page template providing consistent layout across all pages
/// Includes: Header (optional), Hero Section, Content, and Footer
///
/// Usage:
/// ```dart
/// BasePage(
///   title: 'Page Title',
///   breadcrumbItems: [
///     BreadcrumbItem(label: 'Home'),
///     BreadcrumbItem(label: 'Page Title', isActive: true),
///   ],
///   children: [
///     // Your page content sections here
///   ],
/// )
/// ```
class BasePage extends StatelessWidget {
  /// Page title displayed in hero section
  final String title;

  /// Breadcrumb navigation items
  final List<BreadcrumbItem> breadcrumbItems;

  /// Content sections to display
  final List<Widget> children;

  /// Whether to show the header (app bar)
  final bool showHeader;

  /// Whether to show the footer
  final bool showFooter;

  /// Whether to constrain content width
  final bool constrainContent;

  /// Maximum content width (default: dynamic based on device)
  final double? maxWidth;

  /// Content padding (default: dynamic based on device)
  final EdgeInsetsGeometry? contentPadding;

  /// Background color for the page
  final Color? backgroundColor;

  /// Custom hero section (optional - overrides default)
  final Widget? customHeroSection;

  /// Whether page is in loading state
  final bool isLoading;

  /// Error message to display (if any)
  final String? error;

  /// Callback when retry is pressed (for error state)
  final VoidCallback? onRetry;

  const BasePage({
    super.key,
    required this.title,
    required this.breadcrumbItems,
    required this.children,
    this.showHeader = true,
    this.showFooter = true,
    this.constrainContent = true,
    this.maxWidth,
    this.contentPadding,
    this.backgroundColor,
    this.customHeroSection,
    this.isLoading = false,
    this.error,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.bgW,
      appBar: showHeader ? const Header() : null,
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    // Loading state
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      );
    }

    // Error state
    if (error != null) {
      return _buildErrorState(context);
    }

    // Normal content
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          customHeroSection ??
              PageHeroSection(
                title: title,
                breadcrumbItems: breadcrumbItems,
              ),

          // Content
          _buildContent(context),

          // Footer
          if (showFooter) const FooterSection(),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (!constrainContent) {
      return Column(children: children);
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? ResponsiveHelper.getMaxWidth(context),
        ),
        child: Padding(
          padding: contentPadding ??
              EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.getHorizontalPadding(context),
                vertical: 24,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.primary.withOpacity(0.7),
            ),
            const SizedBox(height: 16),
            Text(
              'حدث خطأ',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              error ?? 'حدث خطأ غير متوقع',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('إعادة المحاولة'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Base page with ViewModel integration
/// Use this when the page needs state management
abstract class BaseStatefulPage<T extends ChangeNotifier> extends StatefulWidget {
  const BaseStatefulPage({super.key});
}

/// Mixin providing standard page state management
mixin BasePageStateMixin<T extends StatefulWidget> on State<T> {
  bool isLoading = false;
  String? error;

  /// Sets loading state
  void setLoading(bool loading) {
    if (mounted) {
      setState(() {
        isLoading = loading;
      });
    }
  }

  /// Sets error state
  void setError(String? errorMessage) {
    if (mounted) {
      setState(() {
        error = errorMessage;
        isLoading = false;
      });
    }
  }

  /// Clears error
  void clearError() {
    if (mounted) {
      setState(() {
        error = null;
      });
    }
  }

  /// Executes async operation with loading/error handling
  Future<R?> executeAsync<R>(Future<R> Function() operation) async {
    setLoading(true);
    try {
      final result = await operation();
      setLoading(false);
      return result;
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }
}
