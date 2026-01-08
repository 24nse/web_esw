import 'package:flutter/material.dart';
import 'package:web_site/core/app_styles.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';
import '../../../../domain/entities/blog_post.dart';

class PostCard extends StatelessWidget {
  final BlogPost post;
  final VoidCallback? onTap;

  const PostCard({
    super.key,
    required this.post,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with category tag
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    post.imageUrl,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 220,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, size: 60, color: Colors.grey),
                      );
                    },
                  ),
                ),
                // Category Tag
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(int.parse(post.categoryColor)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: AppText(
                      post.category,
                      style: AppStyles.styleSemiBold12(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Meta Info
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                        color: const Color(0xFFFF6B35),
                      ),
                      const SizedBox(width: 6),
                      AppText(
                        _formatDate(post.publishDate),
                        style: AppStyles.styleRegular14(context).copyWith(
                          fontSize: getResponsiveFontSize(context, fontSize: 13),
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '•',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.access_time_outlined,
                        size: 16,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(width: 6),
                      AppText(
                        '${post.readTimeMinutes} دقائق قراءة',
                        style: AppStyles.styleRegular14(context).copyWith(
                          fontSize: getResponsiveFontSize(context, fontSize: 13),
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Title
                  AppText(
                    post.title,
                    style: AppStyles.styleBold18(context).copyWith(
                      color: const Color(0xFF0A2463),
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),

                  // Excerpt
                  AppText(
                    post.excerpt,
                    style: AppStyles.styleRegular14(context).copyWith(
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),

                  // Read More Link
                  Row(
                    children: [
                      AppText(
                        'اقرأ المزيد',
                        style: AppStyles.styleSemiBold14(context).copyWith(
                          color: const Color(0xFFFF6B35),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: const Color(0xFFFF6B35),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
