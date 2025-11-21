import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../../../domain/entities/project_details.dart';

class TestimonialSection extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialSection({
    super.key,
    required this.testimonial,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.bgW,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.bgG,width: 3,),
        // boxShadow: AppShadows.card,
      ),
      child: Stack(
        children: [
          // Decorative quotation marks in background
          Positioned(
            left: 40,
            top: 20,
            child: Opacity(
              opacity: 0.05,
              child: Icon(
                Icons.format_quote,
                size: 120,
                color: AppColors.primaryDark,
              ),
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rating and Score
              Row(
                children: [
                  // Stars
                  ...List.generate(5, (index) {
                    return const Icon(
                      Icons.star,
                      color: AppColors.primary,
                      size: 24,
                    );
                  }),
                  const SizedBox(width: 12),
                  
                  // Score
                  Text(
                    testimonial.rating.toStringAsFixed(1),
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Title
              Text(
                testimonial.title,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 16),
              
              // Review Text
              Text(
                testimonial.review,
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.textMuted,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 24),
              
              // Reviewer Info
              Row(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(testimonial.reviewerAvatarUrl),
                    backgroundColor: AppColors.bgG,
                    onBackgroundImageError: (exception, stackTrace) {},
                    child: const Icon(Icons.person, size: 30),
                  ),
                  const SizedBox(width: 16),
                  
                  // Name and Role
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testimonial.reviewerName,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(height: 4),
                      
                      Text(
                        testimonial.reviewerRole,
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
