import '../../domain/entities/award.dart';
import '../../domain/repositories/award_repository.dart';

/// Implementation of AwardRepository
/// Currently uses mock data, can be replaced with API calls
class AwardRepositoryImpl implements AwardRepository {
  // Mock data - Replace with API calls in production
  final List<Award> _mockAwards = const [
    Award(
      id: '1',
      number: '01',
      badgeTitle: 'SAFETY\nEXCELLENCE',
      badgeSubtitle: 'AWARD',
      year: '2025',
      title: 'Safety Excellence Award',
      description: 'جائزة التميز في السلامة المهنية لأعلى معايير الأمان',
    ),
    Award(
      id: '2',
      number: '02',
      badgeTitle: 'BEST\nCONTRACTOR',
      badgeSubtitle: 'AWARD',
      year: '2024',
      title: 'Best Contractor Award',
      description: 'جائزة أفضل مقاول لجودة التنفيذ والالتزام بالمواعيد',
    ),
    Award(
      id: '3',
      number: '03',
      badgeTitle: 'ZERO\nINCIDENT',
      badgeSubtitle: 'AWARD',
      year: '2023',
      title: 'Zero Incident Award',
      description: 'جائزة صفر حوادث للسجل المثالي في السلامة',
    ),
    Award(
      id: '4',
      number: '04',
      badgeTitle: 'TOP\nQUALITY',
      badgeSubtitle: 'AWARD',
      year: '2022',
      title: 'Top Quality Award',
      description: 'جائزة الجودة العالية للتفوق في معايير البناء',
    ),
  ];

  @override
  Future<List<Award>> getAllAwards() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockAwards;
  }

  @override
  Future<List<Award>> getAwardsByYear(String year) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockAwards.where((a) => a.year == year).toList();
  }

  @override
  Future<List<Award>> getLatestAwards({int limit = 4}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final sorted = List<Award>.from(_mockAwards)
      ..sort((a, b) => b.year.compareTo(a.year));
    return sorted.take(limit).toList();
  }
}
