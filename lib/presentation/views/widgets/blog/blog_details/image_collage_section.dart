import 'package:flutter/material.dart';

class ImageCollageSection extends StatelessWidget {
  final String mainImageUrl;
  final String topRightImageUrl;
  final String bottomRightImageUrl;
  final String? label;

  const ImageCollageSection({
    super.key,
    required this.mainImageUrl,
    required this.topRightImageUrl,
    required this.bottomRightImageUrl,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B35).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                label!,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFF6B35),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
          Row(
            children: [
              // Main Large Image
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    mainImageUrl,
                    height: 280,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 280,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, size: 60),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Two Smaller Images Stacked
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        topRightImageUrl,
                        height: 132,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 132,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image, size: 40),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        bottomRightImageUrl,
                        height: 132,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 132,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image, size: 40),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
