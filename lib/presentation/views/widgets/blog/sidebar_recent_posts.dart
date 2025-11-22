import 'package:flutter/material.dart';
import '../../../../domain/entities/blog_post.dart';

class SidebarRecentPosts extends StatelessWidget {
  final List<BlogPost> recentPosts;
  final ValueChanged<BlogPost>? onPostTap;

  const SidebarRecentPosts({
    super.key,
    required this.recentPosts,
    this.onPostTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'آخر المقالات',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A2463),
            ),
          ),
          const SizedBox(height: 20),
          
          // Recent Posts List
          ...recentPosts.asMap().entries.map((entry) {
            final index = entry.key;
            final post = entry.value;
            
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < recentPosts.length - 1 ? 16 : 0,
              ),
              child: GestureDetector(
                onTap: () => onPostTap?.call(post),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Thumbnail
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        post.imageUrl,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 70,
                            height: 70,
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.image,
                              color: Colors.grey[500],
                              size: 30,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Title and Date
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0A2463),
                              height: 1.4,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _formatDate(post.publishDate),
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
