import '../entities/award.dart';
import '../repositories/award_repository.dart';

/// Use case for getting all awards
/// Following Single Responsibility Principle
class GetAllAwards {
  final AwardRepository repository;

  const GetAllAwards(this.repository);

  Future<List<Award>> call() {
    return repository.getAllAwards();
  }
}

/// Use case for getting latest awards
class GetLatestAwards {
  final AwardRepository repository;

  const GetLatestAwards(this.repository);

  Future<List<Award>> call({int limit = 4}) {
    return repository.getLatestAwards(limit: limit);
  }
}
