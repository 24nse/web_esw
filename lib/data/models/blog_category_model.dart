import '../../domain/entities/blog_category.dart';

class BlogCategoryModel extends BlogCategory {
  const BlogCategoryModel({
    required super.id,
    required super.name,
    required super.postCount,
    required super.icon,
  });

  factory BlogCategoryModel.fromJson(Map<String, dynamic> json) {
    return BlogCategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      postCount: json['postCount'] as int,
      icon: json['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'postCount': postCount,
      'icon': icon,
    };
  }
}
