import 'package:flutter/material.dart';

class ArticleSectionHeading extends StatelessWidget {
  final String text;
  final double? fontSize;

  const ArticleSectionHeading({
    super.key,
    required this.text,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 20,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF0A2463),
          height: 1.4,
        ),
      ),
    );
  }
}
