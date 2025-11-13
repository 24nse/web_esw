// newsletter_section.dart
import 'package:flutter/material.dart';
import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

/// قسم النشرة البريدية - مطابق للتصميم
class NewsletterSection extends StatelessWidget {
  const NewsletterSection({super.key});

  @override
  Widget build(BuildContext context) {
    const Color navy = Color(0xFF0C2754); // الكحلي المستخدم في العنوان
    final size = MediaQuery.sizeOf(context);
    final isWide = size.width >= 1100;

    return Directionality(
      textDirection: TextDirection.rtl, // يمكنك تغييره إلى LTR إذا رغبت
      child: CustomPaint(
        foregroundPainter:  UnifiedRulerTicksPainter(
          // أعلى أفقي
          drawTop: true,
          topMode: UnifiedRulerTicksMode.horizontal,
          topStep: 10,
          topPatternHeights: const [14, 6, 10, 6, 14],
          topMargin: 0,
          topStrokeWidth: 1,
          topColor: Color(0xFFD1D5DB),

          // أسفل أفقي (نفس الإعدادات)
          drawBottom: true,
          bottomMode: UnifiedRulerTicksMode.horizontal,
          bottomStep: 10,
          bottomPatternHeights: const [14, 6, 10, 6, 14],
          bottomMargin: 0,
          bottomStrokeWidth: 1,
          bottomColor: Color(0xFFD1D5DB),
        ),

        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: AppSpaces.xxl,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // صور زخرفية جانبية (اختيارية) — عدّل المسارات
              if (isWide) ...[
                Positioned(
                  top: -20,
                  right: null,
                  left: 0,
                  child: _DecorImage(
                    path: 'assets/images/crane_hook.png',
                    width: 140,
                  ),
                ),
                Positioned(
                  bottom: -10,
                  left: null,
                  right: 0,
                  child: _DecorImage(
                    path: 'assets/images/excavator.png',
                    width: 260,
                  ),
                ),
              ],

              // المحتوى الأساسي
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const _AccentTag(text: 'النشرة البريدية'),
                      const SizedBox(height: AppSpaces.md),

                      // العنوان الكبير سطرين، الكلمة الثانية بالبرتقالي
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 8,
                        children: [
                          Text(
                            'انضم إلى نشرتنا للحصول على ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: isWide ? 40 : 30,
                              fontWeight: FontWeight.w800,
                              color: navy,
                              height: 1.15,
                            ),
                          ),
                          Text(
                            'عروض حصرية ورؤى إنشائية!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: isWide ? 40 : 30,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary,
                              height: 1.15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpaces.xl),

                      // شريط الإدخال + زر الاشتراك
                      const _SubscribeBar(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ======================= شارة العنوان ======================= */

class _AccentTag extends StatelessWidget {
  final String text;
  const _AccentTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 28, height: 3, color: AppColors.primary),
        const SizedBox(width: AppSpaces.sm),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            color: Color(0xFF1E3A8A), // أزرق داكن قريب لما في الصورة
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

/* ======================= شريط الاشتراك ======================= */

class _SubscribeBar extends StatefulWidget {
  const _SubscribeBar();

  @override
  State<_SubscribeBar> createState() => _SubscribeBarState();
}

class _SubscribeBarState extends State<_SubscribeBar> {
  final controller = TextEditingController();
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 700;

    final field = MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: AppColors.bgG, // رمادي فاتح مثل الصورة
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: _hover ? AppColors.border : AppColors.border.withOpacity(.8),
          ),
          boxShadow: _hover ? AppShadows.card : const [],
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpaces.md),
        child: Row(
          children: [
            // أيقونة داخل كبسولة صغيرة زرقاء/كحلية
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(999),
                boxShadow: AppShadows.card,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.mark_email_read, color: Color(0xFF0C2754), size: 20),
            ),
            const SizedBox(width: AppSpaces.sm),
            Expanded(
              child: TextField(
                controller: controller,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  color: AppColors.text,
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'أدخل بريدك الإلكتروني',
                  hintStyle: TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.textMuted,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final button = _PrimaryPillButton(
      label: 'اشترك',
      onTap: () {
        // UI فقط للتجربة
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم الاشتراك (تجريبي)', style: TextStyle(fontFamily: 'Cairo')),
            duration: Duration(seconds: 1),
          ),
        );
      },
      horizontalPadding: 28,
      verticalPadding: 14,
    );

    return compact
        ? Column(
      children: [
        field,
        const SizedBox(height: AppSpaces.md),
        button,
      ],
    )
        : Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 420, child: field),
        const SizedBox(width: AppSpaces.md),
        button,
      ],
    );
  }
}

/* ======================= زر كبسولة أساسي ======================= */

class _PrimaryPillButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final double horizontalPadding;
  final double verticalPadding;

  const _PrimaryPillButton({
    required this.label,
    required this.onTap,
    this.horizontalPadding = AppSpaces.lg,
    this.verticalPadding = AppSpaces.sm,
  });

  @override
  State<_PrimaryPillButton> createState() => _PrimaryPillButtonState();
}

class _PrimaryPillButtonState extends State<_PrimaryPillButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding,
          vertical: widget.verticalPadding,
        ),
        decoration: BoxDecoration(
          color: _hover ? AppColors.primary.withOpacity(.92) : AppColors.primary,
          borderRadius: BorderRadius.circular(999),
          boxShadow: AppShadows.card,
        ),
        child: Text(
          widget.label,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

/* ======================= صور زخرفية جانبية ======================= */

class _DecorImage extends StatelessWidget {
  final String path;
  final double width;

  const _DecorImage({required this.path, required this.width});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Image.asset(
        path,
        width: width,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) {
          // لو ما توفرت الأصول، نظهر مساحة شفافة بدلًا منها
          return SizedBox(width: width, height: width * .6);
        },
      ),
    );
  }
}


