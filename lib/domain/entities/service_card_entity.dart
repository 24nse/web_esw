import 'package:flutter/material.dart';

/// Immutable entity representing all data needed for any service card type
/// This follows the Single Responsibility Principle by separating data from UI
class ServiceCardEntity {
  final ServiceCardType type;
  
  // Common fields for all card types
  final String title;
  final String description;
  final IconData icon;
  final bool isHighlighted;
  final VoidCallback? onTap;
  
  // Optional fields for specific card types
  final String? image;
  final List<SocialLink>? socialLinks;
  final String? subtitle;
  final String? phoneNumber;
  final String? date;        // For blog/news cards
  final String? category;    // For blog/news cards
  
  const ServiceCardEntity({
    required this.type,
    required this.title,
    required this.description,
    required this.icon,
    this.isHighlighted = false,
    this.onTap,
    this.image,
    this.socialLinks,
    this.subtitle,
    this.phoneNumber,
    this.date,
    this.category,
  });

  /// Factory constructor for Marketing card (Type A)
  factory ServiceCardEntity.marketing({
    required String image,
    required IconData icon,
    required String title,
    required String description,
    bool isHighlighted = false,
    VoidCallback? onTap,
  }) {
    return ServiceCardEntity(
      type: ServiceCardType.marketing,
      image: image,
      icon: icon,
      title: title,
      description: description,
      isHighlighted: isHighlighted,
      onTap: onTap,
    );
  }

  /// Factory constructor for Team Member card (Type B)
  factory ServiceCardEntity.teamMember({
    required String image,
    required IconData icon,
    required String title,
    required String description,
    List<SocialLink>? socialLinks,
    VoidCallback? onTap,
  }) {
    return ServiceCardEntity(
      type: ServiceCardType.teamMember,
      image: image,
      icon: icon,
      title: title,
      description: description,
      socialLinks: socialLinks,
      onTap: onTap,
    );
  }

  /// Factory constructor for Simple card (Type C)
  factory ServiceCardEntity.simple({
    required IconData icon,
    required String title,
    required String subtitle,
    String? phoneNumber,
  }) {
    return ServiceCardEntity(
      type: ServiceCardType.simple,
      icon: icon,
      title: title,
      description: subtitle,
      subtitle: subtitle,
      phoneNumber: phoneNumber,
    );
  }

  /// Factory constructor for Blog/News card (Type D)
  factory ServiceCardEntity.blogNews({
    required String image,
    required IconData icon,
    required String title,
    required String description,
    required String date,
    required String category,
    bool isHighlighted = false,
    VoidCallback? onTap,
  }) {
    return ServiceCardEntity(
      type: ServiceCardType.blogNews,
      image: image,
      icon: icon,
      title: title,
      description: description,
      date: date,
      category: category,
      isHighlighted: isHighlighted,
      onTap: onTap,
    );
  }

  /// Creates a copy with modified fields
  ServiceCardEntity copyWith({
    ServiceCardType? type,
    String? title,
    String? description,
    IconData? icon,
    bool? isHighlighted,
    VoidCallback? onTap,
    String? image,
    List<SocialLink>? socialLinks,
    String? subtitle,
    String? phoneNumber,
    String? date,
    String? category,
  }) {
    return ServiceCardEntity(
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      isHighlighted: isHighlighted ?? this.isHighlighted,
      onTap: onTap ?? this.onTap,
      image: image ?? this.image,
      socialLinks: socialLinks ?? this.socialLinks,
      subtitle: subtitle ?? this.subtitle,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      date: date,
      category: category,
    );
  }
}

/// Enum defining the four card types
enum ServiceCardType {
  marketing,  // Type A - Marketing services card with image and hover effects
  teamMember, // Type B - Team member card with split background
  simple,     // Type C - Simple sidebar card
  blogNews,   // Type D - Blog/News card with date and category badge
}

/// Social link model for team member cards
class SocialLink {
  final IconData icon;
  final String url;
  final Color? color;

  const SocialLink({
    required this.icon,
    required this.url,
    this.color,
  });
}
