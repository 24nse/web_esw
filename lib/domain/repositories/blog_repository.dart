import '../entities/blog_post.dart';
import '../entities/blog_category.dart';

abstract class BlogRepository {
  Future<List<BlogPost>> getBlogPosts();
  Future<List<BlogCategory>> getCategories();
  Future<List<BlogPost>> getRecentPosts(int limit);
}
