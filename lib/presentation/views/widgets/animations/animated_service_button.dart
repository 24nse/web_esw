// زر الخدمة مع تأثير Hover
import 'package:flutter/material.dart';

class AnimatedServiceButton extends StatefulWidget {
  final String text;

  const AnimatedServiceButton({super.key, required this.text});

  @override
  State<AnimatedServiceButton> createState() => _AnimatedServiceButtonState();
}

class _AnimatedServiceButtonState extends State<AnimatedServiceButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: _isHovered ? const Color(0xFFFF6B2C).withOpacity(0.1) : Colors.white,
          border: Border.all(
            color: _isHovered ? const Color(0xFFFF6B2C) : Colors.grey[300]!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: const Color(0xFFFF6B2C).withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ]
              : [],
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              color: _isHovered ? const Color(0xFFFF6B2C) : Colors.grey[700],
              fontSize: 12,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
