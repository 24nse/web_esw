class TeamMember {
  final String id;
  final String name;
  final String title;
  final String description;
  final String imageUrl;
  final ContactInfo contactInfo;
  final SocialMedia socialMedia;
  final List<ProfessionalSkill> skills;

  const TeamMember({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.contactInfo,
    required this.socialMedia,
    required this.skills,
  });
}

class ContactInfo {
  final String phone;
  final String email;

  const ContactInfo({
    required this.phone,
    required this.email,
  });
}

class SocialMedia {
  final String? facebook;
  final String? twitter;
  final String? linkedin;
  final String? instagram;

  const SocialMedia({
    this.facebook,
    this.twitter,
    this.linkedin,
    this.instagram,
  });
}

class ProfessionalSkill {
  final String name;
  final int percentage;

  const ProfessionalSkill({
    required this.name,
    required this.percentage,
  });
}
