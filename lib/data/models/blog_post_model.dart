import '../../domain/entities/blog_post.dart';

class BlogPostModel extends BlogPost {
  const BlogPostModel({
    required super.id,
    required super.title,
    required super.excerpt,
    required super.content,
    required super.category,
    required super.categoryColor,
    required super.imageUrl,
    required super.authorName,
    required super.authorAvatar,
    required super.publishDate,
    required super.readTimeMinutes,
    required super.commentsCount,
    required super.tags,
  });

  factory BlogPostModel.fromJson(Map<String, dynamic> json) {
    return BlogPostModel(
      id: json['id'] as String,
      title: json['title'] as String,
      excerpt: json['excerpt'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      categoryColor: json['categoryColor'] as String,
      imageUrl: json['imageUrl'] as String,
      authorName: json['authorName'] as String,
      authorAvatar: json['authorAvatar'] as String,
      publishDate: DateTime.parse(json['publishDate'] as String),
      readTimeMinutes: json['readTimeMinutes'] as int,
      commentsCount: json['commentsCount'] as int,
      tags: List<String>.from(json['tags'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'excerpt': excerpt,
      'content': content,
      'category': category,
      'categoryColor': categoryColor,
      'imageUrl': imageUrl,
      'authorName': authorName,
      'authorAvatar': authorAvatar,
      'publishDate': publishDate.toIso8601String(),
      'readTimeMinutes': readTimeMinutes,
      'commentsCount': commentsCount,
      'tags': tags,
    };
  }
}
