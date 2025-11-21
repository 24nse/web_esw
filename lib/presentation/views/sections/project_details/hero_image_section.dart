import 'package:flutter/material.dart';

import '../../widgets/graphics/clippers.dart';
import '../company/who_are_you_section.dart';

class HeroImageSection extends StatelessWidget {
  final String imageUrl;

  const HeroImageSection({
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
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        child: Image.network(
          imageUrl,
          height: 320,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 320,
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.image, size: 64),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Custom clipper for top-left angled cut
class _TopLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    
    // Start from top-left with angle
    path.moveTo(60, 0);
    
    // Top edge
    path.lineTo(size.width, 0);
    
    // Right edge
    path.lineTo(size.width, size.height);
    
    // Bottom edge
    path.lineTo(0, size.height);
    
    // Left edge
    path.lineTo(0, 30);
    
    // Diagonal cut in top-left
    path.lineTo(60, 0);
    
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
