class BlogPost {
  final String id;
  final String title;
  final String excerpt;
  final String content;
  final String category;
  final String categoryColor;
  final String imageUrl;
  final String authorName;
  final String authorAvatar;
  final DateTime publishDate;
  final int readTimeMinutes;
  final int commentsCount;
  final List<String> tags;

  const BlogPost({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.category,
    required this.categoryColor,
    required this.imageUrl,
    required this.authorName,
    required this.authorAvatar,
    required this.publishDate,
    required this.readTimeMinutes,
    required this.commentsCount,
    required this.tags,
  });
}
