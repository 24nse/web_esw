import 'package:flutter/material.dart';

import 'package:web_site/common/constants/theme/tokens.dart';

/// Central Material 3 theme builder that keeps colors, components, and
/// text styles aligned with the brand palette declared in [AppColors].
class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      surfaceTint: AppColors.primary,
      onPrimary: Colors.white,
      primaryContainer: const Color(0xFFFFD5BF),
      onPrimaryContainer: const Color(0xFF3A1300),
      secondary: const Color(0xFF0A1E4D),
      onSecondary: Colors.white,
      secondaryContainer: const Color(0xFFD9E3FF),
      onSecondaryContainer: const Color(0xFF001338),
      tertiary: const Color(0xFF0EA5E9),
      onTertiary: const Color(0xFF001C2A),
      tertiaryContainer: const Color(0xFFC8F1FF),
      onTertiaryContainer: const Color(0xFF003248),
      error: const Color(0xFFDC2626),
      onError: Colors.white,
      errorContainer: const Color(0xFFFFDAD5),
      onErrorContainer: const Color(0xFF410001),
      surface: AppColors.surface,
      onSurface: AppColors.text,
      onSurfaceVariant: AppColors.gray,
      outline: const Color(0xFF94A3B8),
      outlineVariant: const Color(0xFFCBD5E1),
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: const Color(0xFF1E2735),
      inversePrimary: const Color(0xFFFFB692),
      surfaceDim: const Color(0xFFE6E9F0),
      surfaceBright: Colors.white,
      surfaceContainerLowest: Colors.white,
      surfaceContainerLow: const Color(0xFFF7F9FD),
      surfaceContainer: const Color(0xFFF1F4FA),
      surfaceContainerHigh: const Color(0xFFE9EDF4),
      surfaceContainerHighest: const Color(0xFFE0E5EF),
      primaryFixed: const Color(0xFFFFD5BF),
      onPrimaryFixed: const Color(0xFF3A1300),
      primaryFixedDim: const Color(0xFFFFB28A),
      onPrimaryFixedVariant: const Color(0xFF7C2E00),
      secondaryFixed: const Color(0xFFD9E3FF),
      onSecondaryFixed: const Color(0xFF001338),
      secondaryFixedDim: const Color(0xFFAFC1FF),
      onSecondaryFixedVariant: const Color(0xFF1C3265),
      tertiaryFixed: const Color(0xFFC8F1FF),
      onTertiaryFixed: const Color(0xFF001F31),
      tertiaryFixedDim: const Color(0xFF8ED8F9),
      onTertiaryFixedVariant: const Color(0xFF004C6A),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    final base = lightScheme();
    return base.copyWith(
      primary: const Color(0xFFE2571A),
      primaryContainer: const Color(0xFFF38D57),
      onPrimaryContainer: Colors.white,
      secondary: const Color(0xFF082247),
      secondaryContainer: const Color(0xFF29406F),
      tertiary: const Color(0xFF056D9C),
      tertiaryContainer: const Color(0xFF1E85B4),
      outline: const Color(0xFF6B7687),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    final base = lightScheme();
    return base.copyWith(
      primary: const Color(0xFF3B0C00),
      onPrimary: Colors.white,
      primaryContainer: const Color(0xFF631F04),
      secondary: const Color(0xFF071633),
      onSecondary: Colors.white,
      secondaryContainer: const Color(0xFF132E62),
      tertiary: const Color(0xFF002438),
      onTertiary: Colors.white,
      tertiaryContainer: const Color(0xFF003852),
      outline: const Color(0xFF232A36),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFFB28A),
      surfaceTint: Color(0xFFFFB28A),
      onPrimary: Color(0xFF4B1500),
      primaryContainer: Color(0xFF7C2E00),
      onPrimaryContainer: Color(0xFFFFD5BF),
      secondary: Color(0xFFAFC1FF),
      onSecondary: Color(0xFF082247),
      secondaryContainer: Color(0xFF1F325C),
      onSecondaryContainer: Color(0xFFD9E3FF),
      tertiary: Color(0xFF8ED8F9),
      onTertiary: Color(0xFF003549),
      tertiaryContainer: Color(0xFF004C6A),
      onTertiaryContainer: Color(0xFFC8F1FF),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF680003),
      errorContainer: Color(0xFF930006),
      onErrorContainer: Color(0xFFFFDAD5),
      surface: Color(0xFF0B121F),
      onSurface: Color(0xFFE0E6F3),
      onSurfaceVariant: Color(0xFFBEC6D5),
      outline: Color(0xFF8592A7),
      outlineVariant: Color(0xFF404857),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFEDEFF5),
      inversePrimary: AppColors.primary,
      surfaceDim: Color(0xFF0B121F),
      surfaceBright: Color(0xFF1E2738),
      surfaceContainerLowest: Color(0xFF03070F),
      surfaceContainerLow: Color(0xFF0D1522),
      surfaceContainer: Color(0xFF121A29),
      surfaceContainerHigh: Color(0xFF182233),
      surfaceContainerHighest: Color(0xFF1F283C),
      primaryFixed: Color(0xFFFFD5BF),
      onPrimaryFixed: Color(0xFF3A1300),
      primaryFixedDim: Color(0xFFFFB28A),
      onPrimaryFixedVariant: Color(0xFF602100),
      secondaryFixed: Color(0xFFD9E3FF),
      onSecondaryFixed: Color(0xFF001338),
      secondaryFixedDim: Color(0xFFAFC1FF),
      onSecondaryFixedVariant: Color(0xFF1A315F),
      tertiaryFixed: Color(0xFFC8F1FF),
      onTertiaryFixed: Color(0xFF001F31),
      tertiaryFixedDim: Color(0xFF8ED8F9),
      onTertiaryFixedVariant: Color(0xFF00445F),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    final base = darkScheme();
    return base.copyWith(
      primary: const Color(0xFFFFBE99),
      onPrimary: const Color(0xFF331000),
      secondary: const Color(0xFFBCCDFF),
      onSecondary: const Color(0xFF021838),
      tertiary: const Color(0xFFA3E1FF),
      onTertiary: const Color(0xFF002537),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    final base = darkScheme();
    return base.copyWith(
      primary: Colors.white,
      onPrimary: Colors.black,
      primaryContainer: const Color(0xFFFFD5BF),
      onPrimaryContainer: Colors.black,
      secondary: Colors.white,
      onSecondary: Colors.black,
      secondaryContainer: const Color(0xFFD9E3FF),
      onSecondaryContainer: Colors.black,
      tertiary: Colors.white,
      onTertiary: Colors.black,
      tertiaryContainer: const Color(0xFFC8F1FF),
      onTertiaryContainer: Colors.black,
      outline: const Color(0xFFE8ECF5),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) {
    final appliedTextTheme = textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
      decorationColor: colorScheme.onSurfaceVariant,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      textTheme: appliedTextTheme.copyWith(
        titleLarge: appliedTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        titleMedium: appliedTextTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        headlineMedium: appliedTextTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
        labelLarge: appliedTextTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: appliedTextTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.lg),
        margin: EdgeInsets.zero,
        shadowColor: AppShadows.card.first.color,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHigh,
        selectedColor: colorScheme.primary.withValues(alpha: 0.12),
        disabledColor: colorScheme.surfaceContainerLowest,
        padding: const EdgeInsets.symmetric(horizontal: AppSpaces.md, vertical: AppSpaces.xs),
        pressElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
        labelStyle: appliedTextTheme.labelMedium?.copyWith(color: colorScheme.onSurfaceVariant),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: AppSpaces.lg,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerLow,
        border: OutlineInputBorder(
          borderRadius: AppRadii.md,
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadii.md,
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadii.md,
          borderSide: BorderSide(color: colorScheme.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: AppSpaces.lg, vertical: AppSpaces.md),
        labelStyle: appliedTextTheme.labelLarge?.copyWith(color: colorScheme.onSurfaceVariant),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: appliedTextTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: AppSpaces.xl, vertical: AppSpaces.md),
          shape: RoundedRectangleBorder(borderRadius: AppRadii.lg),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          textStyle: appliedTextTheme.labelLarge,
          shadowColor: colorScheme.secondary.withValues(alpha: 0.25),
          elevation: 1,
          padding: const EdgeInsets.symmetric(horizontal: AppSpaces.xl, vertical: AppSpaces.md),
          shape: RoundedRectangleBorder(borderRadius: AppRadii.lg),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
          textStyle: appliedTextTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: AppSpaces.xl, vertical: AppSpaces.md),
          shape: RoundedRectangleBorder(borderRadius: AppRadii.lg),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: appliedTextTheme.labelLarge,
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colorScheme.primary,
        textColor: colorScheme.onSurface,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.md),
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: appliedTextTheme.bodyMedium?.copyWith(color: colorScheme.onInverseSurface),
        actionTextColor: colorScheme.inversePrimary,
        behavior: SnackBarBehavior.floating,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.lg),
      ),
    );
  }

  List<ExtendedColor> get extendedColors => const [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
