// footer_alwael.dart
import 'package:flutter/material.dart';
import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

import 'package:web_site/common/utils/responsive_helper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    const Color onDark = Colors.white;
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomPaint(
        foregroundPainter: UnifiedRulerTicksPainter(
          drawTop: true,
          topMode: UnifiedRulerTicksMode.diagonal,
          topStep: 16,
          topPatternHeights: const [20],
          topAngleDeg: 60,
          topDirection: DiagonalDirection.downLeft,
          topMargin: 0,
          topStrokeWidth: 1,
          topColor: const Color(0xFF5F83C8),
          drawBottom: false,
        ),
        child: Column(
          children: [
            Container(
              color: const Color(0xFF001656),
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.getHorizontalPadding(context),
                vertical: isMobile ? AppSpaces.lg : AppSpaces.xl,
              ),
              child: Column(
                children: [
                  _HeaderRow(
                    titleStyle: (isMobile ? textTheme.headlineSmall : textTheme.headlineMedium)?.copyWith(
                      color: onDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpaces.md),
                  Divider(
                    color: onDark.withOpacity(.2),
                    height: AppSpaces.lg,
                    thickness: 1,
                  ),
                  const SizedBox(height: AppSpaces.lg),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
                      mainAxisExtent: isMobile ? 180 : 220,
                      crossAxisSpacing: AppSpaces.xl,
                      mainAxisSpacing: AppSpaces.lg,
                    ),
                    children: const [
                      _BrandColumn(),
                      _NavColumn(),
                      _ContactColumn(),
                      _SubscribeColumn(),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.primary,
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.getHorizontalPadding(context),
                vertical: 12,
              ),
              child: isMobile
                  ? Column(
                      children: [
                        Text(
                          '© 2025 موسسة الوعل للمقاولات العامة والعقارات.',
                          style: textTheme.labelMedium?.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Wrap(
                          spacing: AppSpaces.sm,
                          children: [
                            _BottomLink('شروط الاستخدام'),
                            Text('|', style: TextStyle(color: Colors.white)),
                            _BottomLink('سياسة الخصوصية'),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Text(
                            '© 2025 موسسة الوعل للمقاولات العامة والعقارات. جميع الحقوق محفوظة.',
                            style: textTheme.labelLarge?.copyWith(color: Colors.white),
                          ),
                        ),
                        const Wrap(
                          spacing: AppSpaces.sm,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            _BottomLink('شروط الاستخدام'),
                            Text('|', style: TextStyle(color: Colors.white)),
                            _BottomLink('سياسة الخصوصية'),
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ========================= عناصر الفوتر ========================= */

class _HeaderRow extends StatelessWidget {
  final TextStyle? titleStyle;
  const _HeaderRow({this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // العنوان: "خلّنا نتواصل هناك" مع إبراز "نتواصل" بالبرتقالي
        Expanded(
          child: Wrap(
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text('خلّنا ', style: titleStyle),
              Text('نتواصل',
                  style: titleStyle?.copyWith(color: AppColors.primary)),
              Text(' هناك', style: titleStyle),
            ],
          ),
        ),
        const _PrimaryPill(label: 'تواصل معنا'),
      ],
    );
  }
}

class _BrandColumn extends StatelessWidget {
  const _BrandColumn();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.handyman, color: Colors.white, size: 20),
            ),
            const SizedBox(width: AppSpaces.sm),
            Expanded(
              child: Text(
                'موسسة الوعل للمقاولات العامة والعقارات',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: t.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpaces.sm),
        Text(
          'نقدّم حلولاً احترافية في المقاولات العامة وتطوير العقارات مع الالتزام بالجودة والموثوقية.',
          style: t.bodyMedium?.copyWith(
            color: Colors.white70,
            height: 1.6,
          ),
        ),
        const SizedBox(height: AppSpaces.md),
        const _SocialRow(),
      ],
    );
  }
}

class _NavColumn extends StatelessWidget {
  const _NavColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _SectionTitle('روابط سريعة'),
        _LinkText('فريقنا'),
        _LinkText('تواصل معنا'),
        _LinkText('من نحن'),
        _LinkText('آراء العملاء'),
        _LinkText('الأسئلة الشائعة'),
      ],
    );
  }
}

class _ContactColumn extends StatelessWidget {
  const _ContactColumn();

  @override
  Widget build(BuildContext context) {
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('التواصل'),
        _ContactLine(icon: Icons.call, text: '966+ 000 000 0000'),
        _ContactLine(icon: Icons.email, text: 'info@alwael.sa'),
        _ContactLine(
          icon: Icons.location_on,
          text: 'الرياض - المملكة العربية السعودية\nحي الأعمال، شارع الملك',
        ),
      ],
    );
  }
}

class _SubscribeColumn extends StatelessWidget {
  const _SubscribeColumn();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle('احصل على آخر المستجدات'),
        SizedBox(height: AppSpaces.sm),
        _EmailField(),
      ],
    );
  }
}

/* ========================= Widgets مساعدة ========================= */

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpaces.sm),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SocialRow extends StatelessWidget {
  const _SocialRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpaces.sm,
      children: const [
        _SocialIcon(icon: Icons.facebook),
        _SocialIcon(icon: Icons.facebook),
        _SocialIcon(icon: Icons.camera_alt), // Instagram بديل
        _SocialIcon(icon: Icons.play_circle_fill), // YouTube
        _SocialIcon(icon: Icons.link),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  const _SocialIcon({required this.icon});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: _hover ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.2),
          boxShadow: _hover ? AppShadows.card : const [],
        ),
        child: Icon(
          widget.icon,
          size: 18,
          color: _hover ? AppColors.text : Colors.white,
        ),
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ContactLine({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpaces.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 0), // لضبط baseline في RTL
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: AppSpaces.sm),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkText extends StatefulWidget {
  final String label;
  const _LinkText(this.label);

  @override
  State<_LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<_LinkText> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Colors.white,
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          widget.label,
          style: style?.copyWith(
            decoration: _hover ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class _PrimaryPill extends StatefulWidget {
  final String label;
  const _PrimaryPill({required this.label});

  @override
  State<_PrimaryPill> createState() => _PrimaryPillState();
}

class _PrimaryPillState extends State<_PrimaryPill> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpaces.lg,
        vertical: AppSpaces.sm,
      ),
      decoration: BoxDecoration(
        color: _hover ? AppColors.primary.withOpacity(.9) : AppColors.primary,
        borderRadius: BorderRadius.circular(999),
        boxShadow: AppShadows.card,
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        cursor: SystemMouseCursors.click,
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _EmailField extends StatefulWidget {
  const _EmailField();

  @override
  State<_EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<_EmailField> {
  bool _hover = false;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // خلفية الحقل على الخلفية الداكنة (مشتقة من الأبيض لتناسب التباين)
    final Color fieldBg = Colors.white.withOpacity(.08);

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: fieldBg,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: _hover ? Colors.white54 : Colors.transparent,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpaces.md),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: 'البريد الإلكتروني',
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(width: AppSpaces.sm),
            _SendBtn(onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم الإرسال (تجريبي)', style: TextStyle()),
                  duration: Duration(seconds: 1),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _SendBtn extends StatefulWidget {
  final VoidCallback onTap;
  const _SendBtn({required this.onTap});

  @override
  State<_SendBtn> createState() => _SendBtnState();
}

class _SendBtnState extends State<_SendBtn> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (h) => setState(() => _hover = h),
      borderRadius: BorderRadius.circular(999),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: 44,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _hover ? AppColors.primary.withOpacity(.9) : AppColors.primary,
          borderRadius: BorderRadius.circular(999),
          boxShadow: _hover ? AppShadows.card : const [],
        ),
        child: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
      ),
    );
  }
}

class _BottomLink extends StatefulWidget {
  final String label;
  const _BottomLink(this.label);

  @override
  State<_BottomLink> createState() => _BottomLinkState();
}

class _BottomLinkState extends State<_BottomLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Text(
        widget.label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.white,
          decoration: _hover ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}


