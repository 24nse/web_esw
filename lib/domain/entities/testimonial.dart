import 'package:equatable/equatable.dart';

/// Domain entity representing a customer testimonial
class Testimonial extends Equatable {
  final String id;
  final double rating;
  final String title;
  final String description;
  final String clientName;
  final String clientLabel;
  final String? avatarUrl;
  final DateTime? createdAt;

  const Testimonial({
    required this.id,
    required this.rating,
    required this.title,
    required this.description,
    required this.clientName,
    required this.clientLabel,
    this.avatarUrl,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        rating,
        title,
        description,
        clientName,
        clientLabel,
        avatarUrl,
        createdAt,
      ];

  /// Creates a copy of this testimonial with the given fields replaced
  Testimonial copyWith({
    String? id,
    double? rating,
    String? title,
    String? description,
    String? clientName,
    String? clientLabel,
    String? avatarUrl,
    DateTime? createdAt,
  }) {
    return Testimonial(
      id: id ?? this.id,
      rating: rating ?? this.rating,
      title: title ?? this.title,
      description: description ?? this.description,
      clientName: clientName ?? this.clientName,
      clientLabel: clientLabel ?? this.clientLabel,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
