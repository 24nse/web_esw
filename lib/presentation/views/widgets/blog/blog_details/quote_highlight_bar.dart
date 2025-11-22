import 'package:flutter/material.dart';

class QuoteHighlightBar extends StatelessWidget {
  final String text;

  const QuoteHighlightBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0A2463),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          height: 1.7,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
