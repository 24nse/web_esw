import 'package:flutter/material.dart';

/// Mixin providing scroll controller functionality for horizontal scrolling widgets
/// 
/// This mixin eliminates code duplication by providing common scroll behavior
/// that can be mixed into any StatefulWidget that needs horizontal scrolling.
/// 
/// Benefits:
/// - Code Reuse: Share scroll logic across multiple widgets
/// - Consistency: Same scroll behavior everywhere
/// - Maintainability: Update scroll logic in one place
/// - Clean Code: Separates scroll concerns from widget logic
/// 
/// Usage:
/// ```dart
/// class _MyWidgetState extends State<MyWidget> 
///     with HorizontalScrollMixin<MyWidget> {
///   
///   @override
///   double get scrollOffset => 400.0; // Optional override
///   
///   @override
///   Widget build(BuildContext context) {
///     return SingleChildScrollView(
///       controller: scrollController,
///       scrollDirection: Axis.horizontal,
///       child: // your content
///     );
///   }
/// }
/// ```
mixin HorizontalScrollMixin<T extends StatefulWidget> on State<T> {
  late final ScrollController scrollController;
  
  /// Distance to scroll on each scroll action
  /// Override this in your widget to customize scroll distance
  double get scrollOffset => 360.0;
  
  /// Animation duration for scroll
  /// Override this to customize animation speed
  Duration get scrollDuration => const Duration(milliseconds: 300);
  
  /// Animation curve for scroll
  /// Override this to customize animation curve
  Curve get scrollCurve => Curves.easeInOut;
  
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }
  
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  
  /// Scrolls left by [scrollOffset] pixels
  void scrollLeft() {
    scrollController.animateTo(
      scrollController.offset - scrollOffset,
      duration: scrollDuration,
      curve: scrollCurve,
    );
  }
  
  /// Scrolls right by [scrollOffset] pixels
  void scrollRight() {
    scrollController.animateTo(
      scrollController.offset + scrollOffset,
      duration: scrollDuration,
      curve: scrollCurve,
    );
  }
  
  /// Scrolls to a specific position
  void scrollToPosition(double position) {
    scrollController.animateTo(
      position,
      duration: scrollDuration,
      curve: scrollCurve,
    );
  }
  
  /// Scrolls to the beginning
  void scrollToStart() {
    scrollToPosition(0);
  }
  
  /// Scrolls to the end
  void scrollToEnd() {
    scrollToPosition(scrollController.position.maxScrollExtent);
  }
  
  /// Whether the scroll is at the start
  bool get isAtStart => scrollController.hasClients && scrollController.offset <= 0;
  
  /// Whether the scroll is at the end
  bool get isAtEnd => scrollController.hasClients && 
      scrollController.offset >= scrollController.position.maxScrollExtent;
}
