import '../entities/blog_category.dart';
import '../repositories/blog_repository.dart';

class GetCategoriesUseCase {
  final BlogRepository repository;

  const GetCategoriesUseCase(this.repository);

  Future<List<BlogCategory>> call() async {
    return await repository.getCategories();
  }
}
