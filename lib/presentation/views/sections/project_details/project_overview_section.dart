import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../widgets/project_details/info_metadata_card.dart';

class ProjectOverviewSection extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final String location;
  final String totalArea;
  final String year;

  const ProjectOverviewSection({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.totalArea,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Title and Description
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                style: textTheme.headlineLarge?.copyWith(
                  color: AppColors.primaryDark,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 24),
              
              // Description with orange circle icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Orange circle icon
                  Container(
                    width: 24,
                    height: 24,
                    margin: const EdgeInsets.only(top: 4, right: 12),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.location_city,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                  
                  // Description text
                  Expanded(
                    child: Text(
                      description,
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.textMuted,
                        height: 1.8,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(width: 32),
        
        // Right side - Info Card
        InfoMetadataCard(
          category: category,
          location: location,
          totalArea: totalArea,
          year: year,
        ),
      ],
    );
  }
}
