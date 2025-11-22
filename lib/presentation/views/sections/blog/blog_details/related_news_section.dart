import 'package:flutter/material.dart';
import '../../../widgets/blog/blog_details/blog_card_small.dart';

class RelatedNewsSection extends StatelessWidget {
  final List<RelatedPost> relatedPosts;

  const RelatedNewsSection({
    super.key,
    required this.relatedPosts,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          // Section Header
          Column(
            children: [
              Text(
                'مقالات ذات صلة',
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.center,
                text:  TextSpan(
                  style: textTheme.headlineLarge?.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  children: [
                    TextSpan(
                      text: 'آخر ',
                      style: textTheme.headlineLarge?.copyWith(color: Color(0xFF0A2463)),
                    ),
                    TextSpan(
                      text: 'الأخبار والمقالات',
                      style: textTheme.headlineLarge?.copyWith(color: Color(0xFFFF6B35)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          
          // Related Posts Grid
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: relatedPosts.take(3).map((post) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: BlogCardSmall(
                          title: post.title,
                          imageUrl: post.imageUrl,
                          category: post.category,
                          date: post.date,
                          author: post.author,
                          onTap: post.onTap,
                        ),
                      ),
                    );
                  }).toList(),
                );
              } else {
                return Column(
                  children: relatedPosts.take(3).map((post) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: BlogCardSmall(
                        title: post.title,
                        imageUrl: post.imageUrl,
                        category: post.category,
                        date: post.date,
                        author: post.author,
                        onTap: post.onTap,
                      ),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class RelatedPost {
  final String title;
  final String imageUrl;
  final String category;
  final String date;
  final String author;
  final VoidCallback? onTap;

  const RelatedPost({
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.date,
    required this.author,
    this.onTap,
  });
}
