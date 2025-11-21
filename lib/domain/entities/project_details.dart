class ProjectDetails {
  final String id;
  final String title;
  final String category;
  final String location;
  final String totalArea;
  final String year;
  final String heroImageUrl;
  final String description;
  
  // Challenge Section
  final String challengeTitle;
  final String challengeDescription;
  
  // Solution Section
  final String solutionTitle;
  final String solutionDescription;
  final List<SolutionPoint> solutionPoints;
  
  // Gallery
  final List<String> galleryImages;
  
  // Scope of Work
  final String scopeTitle;
  final String scopeDescription;
  final List<ScopeItem> scopeItems;
  
  // Result
  final String resultTitle;
  final String resultDescription;
  
  // Testimonial
  final Testimonial testimonial;
  
  // Related Projects
  final List<RelatedProject> relatedProjects;

  const ProjectDetails({
    required this.id,
    required this.title,
    required this.category,
    required this.location,
    required this.totalArea,
    required this.year,
    required this.heroImageUrl,
    required this.description,
    required this.challengeTitle,
    required this.challengeDescription,
    required this.solutionTitle,
    required this.solutionDescription,
    required this.solutionPoints,
    required this.galleryImages,
    required this.scopeTitle,
    required this.scopeDescription,
    required this.scopeItems,
    required this.resultTitle,
    required this.resultDescription,
    required this.testimonial,
    required this.relatedProjects,
  });
}

class SolutionPoint {
  final String icon;
  final String title;
  final String description;

  const SolutionPoint({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class ScopeItem {
  final String icon;
  final String title;
  final String description;

  const ScopeItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class Testimonial {
  final double rating;
  final String title;
  final String review;
  final String reviewerName;
  final String reviewerRole;
  final String reviewerAvatarUrl;

  const Testimonial({
    required this.rating,
    required this.title,
    required this.review,
    required this.reviewerName,
    required this.reviewerRole,
    required this.reviewerAvatarUrl,
  });
}

class RelatedProject {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> tags;

  const RelatedProject({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.tags,
  });
}
