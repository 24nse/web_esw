# Page & Section Style Guide

## Unified Standard Format for Pages and Sections

This document defines the standard format for building consistent pages and sections.

---

## 🏗️ Page Structure

### Standard Page Template

```dart
import 'package:flutter/material.dart';
import 'package:web_site/presentation/views/pages/base/base_page.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'عنوان الصفحة',
      breadcrumbItems: const [
        BreadcrumbItem(label: 'الرئيسية'),
        BreadcrumbItem(label: 'عنوان الصفحة', isActive: true),
      ],
      children: [
        // Sections go here
        const ExampleSection(),
        const SizedBox(height: 30),
        const AnotherSection(),
      ],
    );
  }
}
```

### StatefulWidget Page Template (with loading/error)

```dart
class ExampleStatefulPage extends StatefulWidget {
  const ExampleStatefulPage({super.key});

  @override
  State<ExampleStatefulPage> createState() => _ExampleStatefulPageState();
}

class _ExampleStatefulPageState extends State<ExampleStatefulPage>
    with BasePageStateMixin {
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final result = await executeAsync(() => repository.getItems());
    if (result != null) {
      setState(() => _items = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'عنوان الصفحة',
      breadcrumbItems: const [...],
      isLoading: isLoading,
      error: error,
      onRetry: _loadData,
      children: [
        // Content when loaded
      ],
    );
  }
}
```

---

## 📦 Section Structure

### Standard Section Template

```dart
import 'package:flutter/material.dart';
import 'package:web_site/presentation/views/widgets/common/base_section.dart';

class ExampleSection extends StatelessWidget {
  const ExampleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseSection(
      sectionTitle: 'عنوان القسم',
      titleDescription1: 'الوصف الأول\n',
      titleDescription2: 'الوصف الثاني',
      backgroundColor: AppColors.bgW,
      children: [
        // Section content here
        _buildContent(),
      ],
    );
  }

  Widget _buildContent() {
    // Build your section content
  }
}
```

### Section Variants

```dart
// Dark background section
DarkSection(
  sectionTitle: 'جوائزنا',
  titleDescription1: 'رحلتنا نحو\n',
  titleDescription2: 'النجاح والتميز',
  children: [...],
)

// Light gray background section
LightSection(
  sectionTitle: 'خدماتنا',
  titleDescription1: 'ما نقدمه\n',
  titleDescription2: 'لعملائنا',
  children: [...],
)

// White background section
WhiteSection(
  sectionTitle: 'آراء العملاء',
  titleDescription1: 'تجارب يشاركها\n',
  titleDescription2: 'عملاؤنا',
  children: [...],
)
```

---

## 📏 Spacing Standards

```dart
class AppSpacing {
  // Page padding
  static const double pagePadding = 24.0;
  
  // Section vertical padding
  static const double sectionPadding = 60.0;
  
  // Max content width
  static const double maxContentWidth = 1100.0;
  
  // Spacing between sections
  static const double sectionSpacing = 30.0;
  
  // Spacing after title
  static const double titleSpacing = 40.0;
  
  // Card spacing in grids
  static const double cardSpacing = 24.0;
}
```

---

## 🎨 Color Usage

```dart
// Backgrounds
AppColors.bgW      // White background (default)
AppColors.bgG      // Light gray background
AppColors.primaryDark  // Dark blue background

// Text
AppColors.primaryDark  // Headings
AppColors.primary      // Accent text (orange)
Colors.grey[600]       // Body text

// Interactive
AppColors.primary      // Buttons, links
```

---

## 📋 Naming Conventions

### Pages
- File: `example_page.dart`
- Class: `ExamplePage`
- Location: `lib/presentation/views/pages/example/`

### Sections
- File: `example_section.dart`
- Class: `ExampleSection`
- Location: `lib/presentation/views/sections/example/`

### Widgets
- File: `example_card.dart`
- Class: `ExampleCard`
- Location: `lib/presentation/views/widgets/example/`

---

## ✅ Checklist for New Pages

- [ ] Uses `BasePage` or follows same structure
- [ ] Has `PageHeroSection` with title and breadcrumbs
- [ ] Content is constrained to max width
- [ ] Falls back to mobile layout
- [ ] Includes loading state
- [ ] Includes error state with retry
- [ ] Has `FooterSection` at bottom
- [ ] Uses consistent spacing
- [ ] Uses `const` where possible
- [ ] Has proper documentation

## ✅ Checklist for New Sections

- [ ] Uses `BaseSection` or variant
- [ ] Has `TitleSection` if needed
- [ ] Uses consistent padding
- [ ] Responsive at different screen sizes
- [ ] Uses `const` where possible
- [ ] Has proper documentation
