import 'package:flutter/material.dart';

class AppColors {
  // Primary brand colors (approximation; easy to change)
  // static const Color primary = Color(0xFF4C6FFF); // Indigo/blue
  static const Color primary = Color(0xFFFF6B2C); // Indigo/ornage
  static const Color primaryDark = Color(0xFF2B4BE8);
  static const Color accent = Color(0xFFFFAA00);
  static const Color gray = Color(0xFF64748B);

  // Neutrals
  static const Color bgW = Color(0xFFF8FAFF);
  static const Color bgG = Color(0xFFf2f4f5);
  static const Color surface = Colors.white;
  static const Color text = Color(0xFF0F172A);
  static const Color textMuted = Color(0xFF64748B);
  static const Color border = Color(0xFFE2E8F0);

  // Status
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
}

class AppGradients {
  static const LinearGradient hero = LinearGradient(
    colors: [Color(0xFF0EA5E9), Color(0xFF4C6FFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppShadows {
  static List<BoxShadow> card = [
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];
}

class AppSpaces {
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

class AppRadii {
  static const BorderRadius sm = BorderRadius.all(Radius.circular(8));
  static const BorderRadius md = BorderRadius.all(Radius.circular(12));
  static const BorderRadius lg = BorderRadius.all(Radius.circular(16));
}
