import 'package:flutter/material.dart';

class SocialShareBar extends StatelessWidget {
  const SocialShareBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _SocialCircle(icon: Icons.facebook, label: 'Facebook'),
        SizedBox(height: 12),
        _SocialCircle(icon: Icons.camera_alt, label: 'Twitter'),
        SizedBox(height: 12),
        _SocialCircle(icon: Icons.business, label: 'LinkedIn'),
        SizedBox(height: 12),
        _SocialCircle(icon: Icons.share, label: 'Share'),
      ],
    );
  }
}

class _SocialCircle extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SocialCircle({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          color: Color(0xFFFF6B35),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
