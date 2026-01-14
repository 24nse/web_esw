import 'package:flutter/material.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/universal_service_card.dart';

/// Generic reusable service slider widget
/// 
/// This widget eliminates code duplication by providing a single,
/// configurable slider that works with any ServiceCardEntity list.
/// 
/// Benefits:
/// - DRY Principle: Single source of truth for slider logic
/// - Reusability: Works with teams, blogs, services, etc.
/// - Maintainability: Changes in one place affect all usages
/// - Testability: Single widget to test
/// 
/// Usage:
/// ```dart
/// GenericServiceSlider(
///   items: teamMembers,
///   scrollOffset: 360,
/// )
/// ```
class GenericServiceSlider extends StatefulWidget {
  /// List of service card entities to display
  final List<ServiceCardEntity> items;
  
  /// Distance to scroll on left/right button press
  final double scrollOffset;
  
  /// Padding around the scrollable area
  final EdgeInsets padding;
  
  /// Spacing between cards
  final double cardSpacing;
  
  /// Whether to show scroll buttons (for desktop)
  final bool showScrollButtons;
  
  const GenericServiceSlider({
    super.key,
    required this.items,
    this.scrollOffset = 360.0,
    this.padding = const EdgeInsets.only(top: 10, bottom: 10),
    this.cardSpacing = 20.0,
    this.showScrollButtons = false,
  });

  @override
  State<GenericServiceSlider> createState() => _GenericServiceSliderState();
}

class _GenericServiceSliderState extends State<GenericServiceSlider> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - widget.scrollOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + widget.scrollOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          padding: widget.padding,
          child: Row(
            children: [
              for (int i = 0; i < widget.items.length; i++) ...[
                UniversalServiceCard(entity: widget.items[i]),
                if (i < widget.items.length - 1) 
                  SizedBox(width: widget.cardSpacing),
              ],
            ],
          ),
        ),
        
        // Optional scroll buttons for desktop
        if (widget.showScrollButtons && widget.items.length > 3) ...[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: _scrollLeft,
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: _scrollRight,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
