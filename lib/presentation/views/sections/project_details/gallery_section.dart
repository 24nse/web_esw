import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

class GallerySection extends StatelessWidget {
  final List<String> imageUrls;

  const GallerySection({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (imageUrls.isNotEmpty)
          Expanded(
            child: _GalleryImage(imageUrl: imageUrls[0]),
          ),
        if (imageUrls.length > 1) ...[
          const SizedBox(width: 24),
          Expanded(
            child: _GalleryImage(imageUrl: imageUrls[1]),
          ),
        ],
      ],
    );
  }
}

class _GalleryImage extends StatelessWidget {
  final String imageUrl;

  const _GalleryImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.card,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          height: 280,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 280,
              color: AppColors.bgG,
              child: const Center(
                child: Icon(Icons.image, size: 64, color: AppColors.textMuted),
              ),
            );
          },
        ),
      ),
    );
  }
}
