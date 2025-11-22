import 'package:flutter/material.dart';

class BlogPageHeader extends StatelessWidget {
  const BlogPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        
        // Label with accent line
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 2,
              color: const Color(0xFFFF6B35),
            ),
            const SizedBox(width: 12),
            Text(
              'الأخبار والمدونة',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // Main Title
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
            children: [
              TextSpan(
                text: 'آخر ',
                style: TextStyle(color: Color(0xFF0A2463)),
              ),
              TextSpan(
                text: 'الأخبار والمقالات',
                style: TextStyle(color: Color(0xFFFF6B35)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
