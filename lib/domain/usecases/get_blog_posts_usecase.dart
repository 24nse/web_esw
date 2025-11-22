import '../entities/blog_post.dart';
import '../repositories/blog_repository.dart';

class GetBlogPostsUseCase {
  final BlogRepository repository;

  const GetBlogPostsUseCase(this.repository);

  Future<List<BlogPost>> call() async {
    return await repository.getBlogPosts();
  }
}
