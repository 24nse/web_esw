import 'package:flutter/material.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/domain/entities/team_member.dart';
import 'package:web_site/presentation/views/pages/team_details/team_details_page.dart';

/// Extension methods for TeamMember entity
/// 
/// These extensions provide convenient conversion methods and utilities
/// for working with TeamMember entities in the presentation layer.
/// 
/// Benefits:
/// - Clean Code: Keeps conversion logic separate from entities
/// - Reusability: Use the same conversion logic everywhere
/// - Type Safety: Compile-time checked conversions
/// - Maintainability: Changes to conversion logic in one place
extension TeamMemberExtensions on TeamMember {
  /// Converts TeamMember to ServiceCardEntity for display in cards
  /// 
  /// This is useful when displaying team members in the universal card system.
  /// 
  /// Usage:
  /// ```dart
  /// final teamMember = TeamMember(...);
  /// final card = teamMember.toServiceCard(context);
  /// ```
  ServiceCardEntity toServiceCard(BuildContext context) {
    return ServiceCardEntity.teamMember(
      image: imageUrl,
      icon: Icons.person,
      title: name,
      description: title,
      socialLinks: _buildSocialLinks(),
      onTap: () => _navigateToDetails(context),
    );
  }

  /// Builds social links from social media information
  List<SocialLink> _buildSocialLinks() {
    final links = <SocialLink>[];

    if (socialMedia.facebook.isNotEmpty) {
      links.add(SocialLink(
        icon: Icons.facebook,
        url: socialMedia.facebook,
      ));
    }

    if (socialMedia.twitter.isNotEmpty) {
      links.add(SocialLink(
        icon: Icons.alternate_email,
        url: socialMedia.twitter,
      ));
    }

    if (socialMedia.linkedin.isNotEmpty) {
      links.add(SocialLink(
        icon: Icons.link,
        url: socialMedia.linkedin,
      ));
    }

    if (socialMedia.instagram.isNotEmpty) {
      links.add(SocialLink(
        icon: Icons.camera_alt,
        url: socialMedia.instagram,
      ));
    }

    // Always add email
    links.add(SocialLink(
      icon: Icons.email,
      url: 'mailto:${contactInfo.email}',
    ));

    return links;
  }

  /// Navigates to team member details page
  void _navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TeamDetailsPage(memberId: id),
      ),
    );
  }

  /// Gets the full name with title
  String get fullNameWithTitle => '$name - $title';

  /// Checks if the member has complete social media information
  bool get hasCompleteSocialMedia {
    return socialMedia.facebook.isNotEmpty &&
        socialMedia.twitter.isNotEmpty &&
        socialMedia.linkedin.isNotEmpty &&
        socialMedia.instagram.isNotEmpty;
  }

  /// Checks if the member has any social media links
  bool get hasSocialMedia {
    return socialMedia.facebook.isNotEmpty ||
        socialMedia.twitter.isNotEmpty ||
        socialMedia.linkedin.isNotEmpty ||
        socialMedia.instagram.isNotEmpty;
  }

  /// Gets the number of skills
  int get skillsCount => skills.length;

  /// Checks if the member has skills
  bool get hasSkills => skills.isNotEmpty;

  /// Gets the average skill percentage
  double get averageSkillPercentage {
    if (skills.isEmpty) return 0.0;
    final total = skills.fold<int>(0, (sum, skill) => sum + skill.percentage);
    return total / skills.length;
  }

  /// Gets top skills (sorted by percentage, descending)
  List<ProfessionalSkill> get topSkills {
    final sortedSkills = List<ProfessionalSkill>.from(skills);
    sortedSkills.sort((a, b) => b.percentage.compareTo(a.percentage));
    return sortedSkills;
  }

  /// Gets skills above a certain percentage threshold
  List<ProfessionalSkill> getSkillsAbove(int threshold) {
    return skills.where((skill) => skill.percentage >= threshold).toList();
  }
}

/// Extension methods for List<TeamMember>
extension TeamMemberListExtensions on List<TeamMember> {
  /// Converts list of TeamMembers to list of ServiceCardEntities
  /// 
  /// Usage:
  /// ```dart
  /// final members = [TeamMember(...), TeamMember(...)];
  /// final cards = members.toServiceCards(context);
  /// ```
  List<ServiceCardEntity> toServiceCards(BuildContext context) {
    return map((member) => member.toServiceCard(context)).toList();
  }

  /// Sorts team members by name (alphabetically)
  List<TeamMember> sortByName() {
    final sorted = List<TeamMember>.from(this);
    sorted.sort((a, b) => a.name.compareTo(b.name));
    return sorted;
  }

  /// Sorts team members by title
  List<TeamMember> sortByTitle() {
    final sorted = List<TeamMember>.from(this);
    sorted.sort((a, b) => a.title.compareTo(b.title));
    return sorted;
  }

  /// Filters members by title containing a keyword
  List<TeamMember> filterByTitle(String keyword) {
    return where((member) {
      return member.title.toLowerCase().contains(keyword.toLowerCase());
    }).toList();
  }

  /// Filters members by name containing a keyword
  List<TeamMember> filterByName(String keyword) {
    return where((member) {
      return member.name.toLowerCase().contains(keyword.toLowerCase());
    }).toList();
  }

  /// Gets members with complete social media profiles
  List<TeamMember> get withCompleteSocialMedia {
    return where((member) => member.hasCompleteSocialMedia).toList();
  }

  /// Gets members with any social media links
  List<TeamMember> get withSocialMedia {
    return where((member) => member.hasSocialMedia).toList();
  }

  /// Gets members with skills
  List<TeamMember> get withSkills {
    return where((member) => member.hasSkills).toList();
  }

  /// Groups members by their title
  Map<String, List<TeamMember>> groupByTitle() {
    final grouped = <String, List<TeamMember>>{};
    for (final member in this) {
      grouped.putIfAbsent(member.title, () => []).add(member);
    }
    return grouped;
  }
}
