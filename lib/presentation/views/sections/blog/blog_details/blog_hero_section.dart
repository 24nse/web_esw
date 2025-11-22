import 'package:flutter/material.dart';

import '../../../widgets/graphics/clippers.dart';

class BlogHeroSection extends StatelessWidget {
  final String imageUrl;

  const BlogHeroSection({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopCornerClipper(
          clipSize: 70,
          topRadius: 8,
          sideRadius: 8,
          isRight: true
      ),
      child: AspectRatio(

        aspectRatio: 16 / 7,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],

              ),
              child: const Icon(
                Icons.image,
                size: 80,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}

