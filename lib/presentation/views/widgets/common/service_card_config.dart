import 'package:flutter/material.dart';

/// Configuration class that holds all dimension constants for ServiceCard
/// This follows the Single Responsibility Principle by separating
/// configuration from UI logic
class ServiceCardConfig {
  // Card dimensions
  final double iconSize;
  final double iconContainerSize;
  final double iconBorderWidth;
  final double iconBottomOffset;
  final double iconRightPosition;
  
  // Spacing
  final double contentPadding;
  final double verticalSpacing;
  final double titleDescriptionSpacing;
  final double descriptionLearnMoreSpacing;
  final double learnMoreIconSpacing;
  
  // Border radius
  final double borderRadius;
  final double topCornerClipSize;
  final double clipperTopRadius;
  final double clipperSideRadius;
  
  // Shadow
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final double shadowOpacity;
  
  // Hover effect
  final double hoverBackgroundHeight;
  final double hoverBackgroundRadius;
  final double hoverBackgroundBottomNormal;
  final double hoverBackgroundBottomHovered;
  
  // Typography
  final double titleFontSize;
  final double descriptionFontSize;
  final double learnMoreFontSize;
  final double learnMoreIconSize;
  
  // Aspect ratio
  final double imageAspectRatio;
  
  // Scale factor for responsive sizing
  final double scaleFactor;

  const ServiceCardConfig({
    required this.iconSize,
    required this.iconContainerSize,
    required this.iconBorderWidth,
    required this.iconBottomOffset,
    required this.iconRightPosition,
    required this.contentPadding,
    required this.verticalSpacing,
    required this.titleDescriptionSpacing,
    required this.descriptionLearnMoreSpacing,
    required this.learnMoreIconSpacing,
    required this.borderRadius,
    required this.topCornerClipSize,
    required this.clipperTopRadius,
    required this.clipperSideRadius,
    required this.shadowBlurRadius,
    required this.shadowOffset,
    required this.shadowOpacity,
    required this.hoverBackgroundHeight,
    required this.hoverBackgroundRadius,
    required this.hoverBackgroundBottomNormal,
    required this.hoverBackgroundBottomHovered,
    required this.titleFontSize,
    required this.descriptionFontSize,
    required this.learnMoreFontSize,
    required this.learnMoreIconSize,
    required this.imageAspectRatio,
    required this.scaleFactor,
  });

  /// Desktop/Tablet configuration (original dimensions)
  static const ServiceCardConfig desktop = ServiceCardConfig(
    iconSize: 24.0,
    iconContainerSize: 60.0,
    iconBorderWidth: 4.0,
    iconBottomOffset: -30.0,
    iconRightPosition: 20.0,
    contentPadding: 20.0,
    verticalSpacing: 35.0,
    titleDescriptionSpacing: 12.0,
    descriptionLearnMoreSpacing: 20.0,
    learnMoreIconSpacing: 8.0,
    borderRadius: 20.0,
    topCornerClipSize: 70.0,
    clipperTopRadius: 8.0,
    clipperSideRadius: 8.0,
    shadowBlurRadius: 20.0,
    shadowOffset: Offset(0, 5),
    shadowOpacity: 0.08,
    hoverBackgroundHeight: 30.0,
    hoverBackgroundRadius: 15.0,
    hoverBackgroundBottomNormal: -3.0,
    hoverBackgroundBottomHovered: -6.0,
    titleFontSize: 16.0,
    descriptionFontSize: 13.0,
    learnMoreFontSize: 13.0,
    learnMoreIconSize: 18.0,
    imageAspectRatio: 16 / 9,
    scaleFactor: 1.0,
  );

  /// Mobile configuration (scaled down by 0.75)
  static const ServiceCardConfig mobile = ServiceCardConfig(
    iconSize: 18.0,
    iconContainerSize: 45.0,
    iconBorderWidth: 3.0,
    iconBottomOffset: -22.5,
    iconRightPosition: 15.0,
    contentPadding: 15.0,
    verticalSpacing: 26.25,
    titleDescriptionSpacing: 9.0,
    descriptionLearnMoreSpacing: 15.0,
    learnMoreIconSpacing: 6.0,
    borderRadius: 15.0,
    topCornerClipSize: 52.5,
    clipperTopRadius: 6.0,
    clipperSideRadius: 6.0,
    shadowBlurRadius: 15.0,
    shadowOffset: Offset(0, 3.75),
    shadowOpacity: 0.08,
    hoverBackgroundHeight: 22.5,
    hoverBackgroundRadius: 11.25,
    hoverBackgroundBottomNormal: -2.25,
    hoverBackgroundBottomHovered: -4.5,
    titleFontSize: 14.0,
    descriptionFontSize: 11.0,
    learnMoreFontSize: 11.0,
    learnMoreIconSize: 14.0,
    imageAspectRatio: 16 / 9,
    scaleFactor: 0.75,
  );

  /// Creates a custom configuration with a specific scale factor
  factory ServiceCardConfig.withScale(double scale) {
    return ServiceCardConfig(
      iconSize: 24.0 * scale,
      iconContainerSize: 60.0 * scale,
      iconBorderWidth: 4.0 * scale,
      iconBottomOffset: -30.0 * scale,
      iconRightPosition: 20.0 * scale,
      contentPadding: 20.0 * scale,
      verticalSpacing: 35.0 * scale,
      titleDescriptionSpacing: 12.0 * scale,
      descriptionLearnMoreSpacing: 20.0 * scale,
      learnMoreIconSpacing: 8.0 * scale,
      borderRadius: 20.0 * scale,
      topCornerClipSize: 70.0 * scale,
      clipperTopRadius: 8.0 * scale,
      clipperSideRadius: 8.0 * scale,
      shadowBlurRadius: 20.0 * scale,
      shadowOffset: Offset(0, 5 * scale),
      shadowOpacity: 0.08,
      hoverBackgroundHeight: 30.0 * scale,
      hoverBackgroundRadius: 15.0 * scale,
      hoverBackgroundBottomNormal: -3.0 * scale,
      hoverBackgroundBottomHovered: -6.0 * scale,
      titleFontSize: 16.0 * scale,
      descriptionFontSize: 13.0 * scale,
      learnMoreFontSize: 13.0 * scale,
      learnMoreIconSize: 18.0 * scale,
      imageAspectRatio: 16 / 9,
      scaleFactor: scale,
    );
  }
}
