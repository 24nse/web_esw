// lib/widgets/refactored_sections.dart
import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart'; // يفترض أن tokens.dart يحتوي AppColors, AppRadii, AppShadows, AppSpaces

/// ---------------------------
/// Section header (reusable)
/// ---------------------------
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextAlign align;

  const SectionHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.align = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cross = align == TextAlign.start ? CrossAxisAlignment.start : CrossAxisAlignment.center;
    return Column(
      crossAxisAlignment: cross,
      children: [
        Text(
          title,
          textAlign: align,
          style: textTheme.headlineMedium?.copyWith(color: AppColors.text),
        ),
        if (subtitle != null) const SizedBox(height: 12),
        if (subtitle != null)
          Text(
            subtitle!,
            textAlign: align,
            style: textTheme.bodyLarge?.copyWith(color: AppColors.textMuted),
          ),
      ],
    );
  }
}

/// ---------------------------
/// Small pill button (reusable)
/// ---------------------------
class PillButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool outlined;

  const PillButton({Key? key, required this.label, this.onTap, this.outlined = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: outlined ? Colors.transparent : AppColors.primary,
        foregroundColor: outlined ? AppColors.primary : Colors.white,
        side: outlined ? BorderSide(color: AppColors.primary) : BorderSide.none,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: AppRadii.lg),
      ),
      child: Text(label, style: const TextStyle()),
    );
  }
}

/// ---------------------------
/// Generic tile/card used in categories/sectors
/// ---------------------------
class TileCard extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const TileCard({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadii.md,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.bgG,
          borderRadius: AppRadii.md,
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle( fontWeight: FontWeight.w800, color: AppColors.text)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle( color: AppColors.textMuted)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black26),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------
/// HoverCard - a reusable card with hover elevation (for web)
/// ---------------------------
class HoverCard extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;
  final VoidCallback? onTap;

  const HoverCard({Key? key, required this.child, this.width = 300, this.height = 260, this.onTap}) : super(key: key);

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final boxShadow = _hovered
        ? [...AppShadows.card, BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 4))]
        : AppShadows.card;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: AppRadii.lg,
            border: Border.all(color: AppColors.border),
            boxShadow: boxShadow,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// ---------------------------
/// ServiceCard (refactored stateless)
/// ---------------------------
class ServiceCardWidget extends StatelessWidget {
  final String image;
  final IconData icon;
  final String title;
  final String description;
  final bool highlighted;

  const ServiceCardWidget({
    Key? key,
    required this.image,
    required this.icon,
    required this.title,
    required this.description,
    this.highlighted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      width: 300,
      height: 320,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            // image placeholder (keep same look)
            Container(
              height: 150,
              width: double.infinity,
              color: const Color(0xFFE5E7EB),
              child: Center(child: Icon(Icons.image, size: 56, color: Colors.grey[400])),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle( fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0A1E4D))),
                  const SizedBox(height: 8),
                  Text(description, style: const TextStyle( fontSize: 13, color: Color(0xFF6B7280), height: 1.5)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text('إعرف المزيد', style: TextStyle(color: highlighted ? AppColors.primary : const Color(0xFF0A1E4D), fontWeight: FontWeight.w600)),
                      const SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 16, color: highlighted ? AppColors.primary : const Color(0xFF0A1E4D)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------
/// Service slider: horizontal list (reusable)
/// ---------------------------
class ServiceSlider extends StatelessWidget {
  final List<ServiceCardData> items;
  final double spacing;

  const ServiceSlider({Key? key, required this.items, this.spacing = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpaces.lg),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(width: spacing),
        itemBuilder: (context, idx) {
          final item = items[idx];
          return ServiceCardWidget(
            image: item.image,
            icon: item.icon,
            title: item.title,
            description: item.description,
            highlighted: item.highlighted,
          );
        },
      ),
    );
  }
}

class ServiceCardData {
  final String image;
  final IconData icon;
  final String title;
  final String description;
  final bool highlighted;
  ServiceCardData({required this.image, required this.icon, required this.title, required this.description, this.highlighted = false});
}

/// ---------------------------
/// PricingSection (uses Plan model)
/// ---------------------------
class PricingSection extends StatelessWidget {
  final List<Plan> plans;

  const PricingSection({Key? key, required this.plans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const SectionHeader(title: 'باقات الخدمات', subtitle: 'اختر الباقة المناسبة لمشروعك؛ جميع الباقات قابلة للتخصيص.'),
              const SizedBox(height: 24),
              LayoutBuilder(builder: (context, constraints) {
                int cross = 3;
                if (constraints.maxWidth < 1000) cross = 2;
                if (constraints.maxWidth < 700) cross = 1;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: plans.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: cross, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.95),
                  itemBuilder: (ctx, i) {
                    final plan = plans[i];
                    final highlighted = i == 1;
                    return _PlanCardView(plan: plan, highlighted: highlighted);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class Plan {
  final String title;
  final String description;
  final String price;
  final List<String> features;
  const Plan({required this.title, required this.description, required this.price, required this.features});
}

class _PlanCardView extends StatelessWidget {
  final Plan plan;
  final bool highlighted;
  const _PlanCardView({Key? key, required this.plan, this.highlighted = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bg = highlighted ? AppColors.primary : AppColors.surface;
    final titleColor = highlighted ? Colors.white : AppColors.text;
    final bodyColor = highlighted ? Colors.white70 : AppColors.textMuted;

    return Container(
      decoration: BoxDecoration(color: bg, borderRadius: AppRadii.lg, border: Border.all(color: highlighted ? Colors.transparent : AppColors.border), boxShadow: AppShadows.card),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(plan.title, style: TextStyle( fontSize: 20, fontWeight: FontWeight.w800, color: titleColor)),
          const SizedBox(height: 8),
          Text(plan.description, style: TextStyle( fontSize: 14, color: bodyColor)),
          const SizedBox(height: 16),
          Text(plan.price, style: TextStyle( fontSize: 28, fontWeight: FontWeight.w800, color: titleColor)),
          const SizedBox(height: 16),
          ...plan.features.map((f) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Icon(Icons.check_circle, size: 18, color: highlighted ? Colors.white : AppColors.success),
                const SizedBox(width: 8),
                Expanded(child: Text(f, style: TextStyle( color: highlighted ? Colors.white : AppColors.text))),
              ],
            ),
          )),
          const Spacer(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: highlighted ? Colors.white : AppColors.primary,
              foregroundColor: highlighted ? AppColors.primary : Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
            ),
            child: const Text('اطلب عرض سعر', style: TextStyle()),
          ),
        ],
      ),
    );
  }
}

/// ---------------------------
/// FAQ Section (clean)
/// ---------------------------
class FAQSectionRefactored extends StatefulWidget {
  final List<FAQItem> items;
  const FAQSectionRefactored({Key? key, required this.items}) : super(key: key);

  @override
  State<FAQSectionRefactored> createState() => _FAQSectionRefactoredState();
}

class _FAQSectionRefactoredState extends State<FAQSectionRefactored> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      color: AppColors.bgG,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const SectionHeader(title: 'الأسئلة الشائعة', subtitle: 'نحن نجاوب عن أهم أسئلتكم بشكل واضح'),
              const SizedBox(height: 30),
              ...widget.items.asMap().entries.map((entry) {
                final idx = entry.key;
                final item = entry.value;
                final isOpen = expandedIndex == idx;
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: isOpen ? const Color(0xFF0A1F44) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    trailing: Icon(isOpen ? Icons.remove : Icons.add, color: isOpen ? Colors.white : const Color(0xFF1A1A2E)),
                    title: Text(item.question, textDirection: TextDirection.rtl, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isOpen ? Colors.white : const Color(0xFF1A1A2E))),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                        child: Text(item.answer, textDirection: TextDirection.rtl, textAlign: TextAlign.right, style: const TextStyle( fontSize: 14, height: 1.6, color: Colors.white70)),
                      )
                    ],
                    onExpansionChanged: (open) {
                      setState(() {
                        expandedIndex = open ? idx : null;
                      });
                    },
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------------------
/// Footer (refactored)
/// ---------------------------
class FooterRefactored extends StatelessWidget {
  final List<_FooterColumnData> columns;
  const FooterRefactored({Key? key, required this.columns}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.text,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 48,
                runSpacing: 24,
                children: columns.map((c) => _FooterColumn(title: c.title, items: c.items)).toList(),
              ),
              const SizedBox(height: 32),
              Divider(color: Colors.white.withOpacity(0.1)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text('© ${DateTime.now().year} شركتنا. جميع الحقوق محفوظة.', style: const TextStyle( color: Colors.white70)),
                  const Spacer(),
                  Row(children: const [Icon(Icons.facebook, color: Colors.white70), SizedBox(width: 12), Icon(Icons.alternate_email, color: Colors.white70), SizedBox(width: 12), Icon(Icons.play_circle, color: Colors.white70)])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterColumnData {
  final String title;
  final List<String> items;
  const _FooterColumnData({required this.title, required this.items});
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;
  const _FooterColumn({Key? key, required this.title, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle( fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...items.map((e) => Padding(padding: const EdgeInsets.symmetric(vertical: 6.0), child: Text(e, style: const TextStyle( color: Colors.white70)))),
      ]),
    );
  }
}

/// ---------------------------
/// Simple models
/// ---------------------------
class FAQItem {
  final String question;
  final String answer;
  const FAQItem({required this.question, required this.answer});
}


