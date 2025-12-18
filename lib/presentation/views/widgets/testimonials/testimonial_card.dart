import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../../domain/entities/testimonial.dart';

/// Reusable testimonial card widget
/// Displays a single testimonial with rating, description, and client info
class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;
  final VoidCallback? onTap;
  final double? maxWidth;

  const TestimonialCard({
    super.key,
    required this.testimonial,
    this.onTap,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: maxWidth != null ? BoxConstraints(maxWidth: maxWidth!) : null,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.black.withOpacity(0.1),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryDark.withOpacity(0.06),
              blurRadius: 24,
              offset: const Offset(0, 10),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Star rating
            _StarRating(rating: testimonial.rating),
            const SizedBox(height: 16),
            // Title
            Text(
              testimonial.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryDark,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 12),
            // Description
            Expanded(
              child: Text(
                testimonial.description,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 1),
            // Client info
            _ClientInfo(
              name: testimonial.clientName,
              label: testimonial.clientLabel,
              avatarUrl: testimonial.avatarUrl,
            ),
          ],
        ),
      ),
    );
  }
}

/// Star rating widget
class _StarRating extends StatelessWidget {
  final double rating;

  const _StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Icon(
              Icons.star,
              size: 20,
              color: index < rating.floor()
                  ? AppColors.primary
                  : Colors.grey[300],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryDark,
          ),
        ),
      ],
    );
  }
}

/// Client info widget with avatar
class _ClientInfo extends StatelessWidget {
  final String name;
  final String label;
  final String? avatarUrl;

  const _ClientInfo({
    required this.name,
    required this.label,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
            image: avatarUrl != null
                ? DecorationImage(
                    image: AssetImage(avatarUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: avatarUrl == null
              ? Icon(Icons.person, color: Colors.grey[400], size: 24)
              : null,
        ),
        const SizedBox(width: 12),
        // Name and label
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDark,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
