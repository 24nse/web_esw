import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

/// Reusable widget for displaying contact information (phone or email)
class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.bgW,
        borderRadius:BorderRadius.circular(32),
        border: Border.all(
          color: AppColors.gray,
              width: 0.12
        )
      ),
      child: Row(
        children: [
          // Orange circular icon background
          Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 12,
            ),
          ),
          const SizedBox(width: 8),

          // Contact text
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.text,
            ),
          ),
        ],
      ),
    );
  }
}
