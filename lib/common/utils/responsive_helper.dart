import 'package:flutter/material.dart';

/// Utility class to handle responsive layout logic
class ResponsiveHelper {
  /// Mobile breakpoint
  static const double mobileBreakpoint = 600;
  
  /// Tablet breakpoint
  static const double tabletBreakpoint = 1024;

  /// Returns true if the screen width is less than [mobileBreakpoint]
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  /// Returns true if the screen width is between [mobileBreakpoint] and [tabletBreakpoint]
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  /// Returns true if the screen width is greater than or equal to [tabletBreakpoint]
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  /// Returns a value based on the current screen size
  static T valueByDevice<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet ?? desktop;
    return desktop;
  }

  /// Returns the maximum content width based on device
  static double getMaxWidth(BuildContext context) {
    if (isMobile(context)) return double.infinity;
    if (isTablet(context)) return 900;
    return 1100;
  }

  /// Returns standard horizontal padding based on device
  static double getHorizontalPadding(BuildContext context) {
    if (isMobile(context)) return 16.0;
    if (isTablet(context)) return 32.0;
    return 40.0;
  }
}
