import '../entities/award.dart';

/// Abstract repository interface for awards
/// Following Dependency Inversion Principle
abstract class AwardRepository {
  /// Gets all company awards
  Future<List<Award>> getAllAwards();

  /// Gets awards by year
  Future<List<Award>> getAwardsByYear(String year);

  /// Gets the latest awards
  Future<List<Award>> getLatestAwards({int limit = 4});
}
