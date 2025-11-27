import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

/// Social media icons bar with Arabic "CONNECT NOW" label
class SocialIconsBar extends StatelessWidget {
  final String? facebookUrl;
  final String? twitterUrl;
  final String? linkedinUrl;
  final String? instagramUrl;

  const SocialIconsBar({
    super.key,
    this.facebookUrl,
    this.twitterUrl,
    this.linkedinUrl,
    this.instagramUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'اتصل الآن', // Arabic for "CONNECT NOW"
          style:textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.gray,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            if (facebookUrl != null) _buildSocialIcon(Icons.facebook, AppColors.primaryDark),
            if (twitterUrl != null) ...[
              const SizedBox(width: 8),
              _buildSocialIcon(Icons.tag, AppColors.secondary),
            ],
            if (linkedinUrl != null) ...[
              const SizedBox(width: 8),
              _buildSocialIcon(Icons.business, AppColors.primaryDark),
            ],
            if (instagramUrl != null) ...[
              const SizedBox(width: 8),
              _buildSocialIcon(Icons.camera_alt, AppColors.primary),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 12,
      ),
    );
  }
}
