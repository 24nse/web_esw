import 'package:flutter/material.dart';
import 'package:web_site/common/utils/responsive_helper.dart';
import 'package:web_site/presentation/views/widgets/common/service_card_config.dart';

/// Factory class that determines the appropriate ServiceCard configuration
/// based on the screen size. This follows the Factory Pattern and separates
/// the sizing logic from the UI rendering logic.
class ServiceCardSizeFactory {
  /// Returns the appropriate ServiceCardConfig based on screen width
  /// 
  /// Uses ResponsiveHelper to detect device type:
  /// - Mobile (< 600px): Returns scaled-down configuration (0.75x)
  /// - Tablet/Desktop (>= 600px): Returns full-size configuration (1.0x)
  static ServiceCardConfig getConfig(BuildContext context) {
    if (ResponsiveHelper.isMobile(context)) {
      return ServiceCardConfig.mobile;
    }
    return ServiceCardConfig.desktop;
  }

  /// Returns a custom configuration with a specific scale factor
  /// This can be used for fine-tuned responsive behavior if needed
  static ServiceCardConfig getConfigWithScale(double scale) {
    return ServiceCardConfig.withScale(scale);
  }

  /// Returns the scale factor based on screen width
  /// This is useful when you need just the scale value
  static double getScaleFactor(BuildContext context) {
    return getConfig(context).scaleFactor;
  }
}
