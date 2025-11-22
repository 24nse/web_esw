import 'package:flutter/material.dart';

class BlogPageHeaderSection extends StatelessWidget {
  const BlogPageHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        // Title and Breadcrumb
        Column(
          children: [
            const Text(
              'تفاصيل المقال',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A2463),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  'الرئيسية',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '/',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                const Text(
                  'تفاصيل المقال',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFF6B35),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        
        // Blue Decorative Bar
        Container(
          height: 8,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF0A2463),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
