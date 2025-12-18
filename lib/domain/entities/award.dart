import 'package:equatable/equatable.dart';

/// Domain entity representing a company award
class Award extends Equatable {
  final String id;
  final String number;
  final String badgeTitle;
  final String badgeSubtitle;
  final String year;
  final String title;
  final String description;

  const Award({
    required this.id,
    required this.number,
    required this.badgeTitle,
    required this.badgeSubtitle,
    required this.year,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        number,
        badgeTitle,
        badgeSubtitle,
        year,
        title,
        description,
      ];

  /// Creates a copy of this award with the given fields replaced
  Award copyWith({
    String? id,
    String? number,
    String? badgeTitle,
    String? badgeSubtitle,
    String? year,
    String? title,
    String? description,
  }) {
    return Award(
      id: id ?? this.id,
      number: number ?? this.number,
      badgeTitle: badgeTitle ?? this.badgeTitle,
      badgeSubtitle: badgeSubtitle ?? this.badgeSubtitle,
      year: year ?? this.year,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
