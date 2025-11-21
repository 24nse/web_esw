import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(24),
        // Diagonal pattern background
        image: DecorationImage(
          image: const AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
          opacity: 0.05,
          onError: (exception, stackTrace) {},
        ),
      ),
      child: Row(
        children: [
          // Left side - Text and Button
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Small label
                Text(
                  'تواصل معنا',
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Main Heading
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'خطط، ابنِ، انجح –\n',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: 'استشرنا ',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: 'اليوم!',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'تواصل معنا',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 32),
          
          // Right side - Engineer Image
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.engineering,
                      size: 80,
                      color: Colors.white38,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
