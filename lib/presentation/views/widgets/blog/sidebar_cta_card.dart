import 'package:flutter/material.dart';
import 'package:web_site/core/app_styles.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';

class SidebarCtaCard extends StatelessWidget {
  final VoidCallback? onContactPressed;

  const SidebarCtaCard({
    super.key,
    this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.network(
              'https://images.unsplash.com/photo-1621905251918-48416bd8575a?w=600',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF0A2463),
                );
              },
            ),
            
            // Dark Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   AppText(
                    'نبني المستقبل\nاليوم',
                    style: AppStyles.styleBold24(context).copyWith(
                      fontSize: getResponsiveFontSize(context, fontSize: 26),
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Contact Button
                  ElevatedButton(
                    onPressed: onContactPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B35),
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
                    child: AppText(
                      'تواصل معنا الآن',
                      style: AppStyles.styleSemiBold16(context).copyWith(
                        fontSize: getResponsiveFontSize(context, fontSize: 15),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
