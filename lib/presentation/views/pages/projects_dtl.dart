import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/sections/home/header.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';
import 'package:web_site/presentation/views/widgets/graphics/diagonal_lines_painter.dart';
import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';
class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      body: _ProjectDetailsView(),
    );
  }
}
class _ProjectDetailsView extends StatelessWidget {
  const _ProjectDetailsView();
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.bgW,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: const [
              _DetailsHero(),
              SizedBox(height: 32),
              _HeroImageSection(),
              SizedBox(height: 48),
              _OverviewSection(),
              SizedBox(height: 40),
              _ChallengeAndSolutionSection(),
              SizedBox(height: 48),
              _ScopeOfWorkSection(),
              SizedBox(height: 40),
              _ResultSection(),
              SizedBox(height: 32),
              _TestimonialSection(),
              SizedBox(height: 40),
              _CallToActionBanner(),
              SizedBox(height: 48),
              _SolutionHighlightsSection(),
              SizedBox(height: 40),
              _GallerySection(),
              SizedBox(height: 48),
              _OtherProjectsSection(),
              SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
class _DetailsHero extends StatelessWidget {
  const _DetailsHero();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomPaint(
      foregroundPainter: const UnifiedRulerTicksPainter(
        drawTop: true,
        topMode: UnifiedRulerTicksMode.horizontal,
        topStep: 12,
        topPatternHeights: [20, 12, 16, 12, 20],
        topStrokeWidth: 1,
        topColor: Color(0xFFCAD4E3),
        drawBottom: true,
        bottomMode: UnifiedRulerTicksMode.horizontal,
        bottomStep: 12,
        bottomPatternHeights: [20, 12, 16, 12, 20],
        bottomStrokeWidth: 1,
        bottomColor: Color(0xFFCAD4E3),
      ),
      child: Container(
        width: double.infinity,
        color: AppColors.bgG,
        padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    'تفاصيل مشروع',
                    style: textTheme.labelLarge?.copyWith(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'مركز الأعمال المتكامل',
                  textAlign: TextAlign.center,
                  style: textTheme.displaySmall?.copyWith(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'الرئيسية / تفاصيل المشروع',
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.gray,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class _HeroImageSection extends StatelessWidget {
  const _HeroImageSection();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 32,
                  offset: const Offset(0, 24),
                ),
              ],
            ),
            child: ClipPath(
              clipper: TopCornerClipper(
                clipSize: 80,
                isLeft: true,
                sideRadius: 24,
                topRadius: 24,
              ),
              child: AspectRatio(
                aspectRatio: 16 / 7,
                child: Image.asset(
                  'assets/images/p2.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class _OverviewSection extends StatelessWidget {
  const _OverviewSection();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1150),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;
              final children = [
                Expanded(
                  flex: 3,
                  child: _ProjectNarrative(textTheme: Theme.of(context).textTheme),
                ),
                const SizedBox(width: 32, height: 32),
                const Expanded(
                  flex: 2,
                  child: _ProjectMetaCard(),
                ),
              ];
              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  children[0],
                  const SizedBox(height: 32),
                  const _ProjectMetaCard(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
class _ProjectNarrative extends StatelessWidget {
  const _ProjectNarrative({required this.textTheme});
  final TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مركز الأعمال الحديث',
          style: textTheme.displaySmall?.copyWith(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                'م',
                style: textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'عملنا على صياغة مجمع أعمال جديد ينسجم مع متطلبات الشركات العالمية من حيث المرونة، المساحات التعاونية، وعمليات التشغيل الذكية.',
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.textMuted,
                  height: 1.8,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'يضم المشروع مساحات مكتبية معيارية، خدمات ضيافة متكاملة، ومنصة رقمية لإدارة البيئة الداخلية. يتمحور التصميم حول توفير تجربة مستخدم هادئة دون التضحية بالتقنيات المتقدمة وإجراءات الأمان.',
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.textMuted,
            height: 1.9,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'رُوعي في المخطط العام فصل مسارات الزوار عن الموظفين، واستثمار الأسطح المفتوحة لإنشاء حدائق معلقة تعزز جودة الهواء وتحفز على التواصل اليومي بين الفرق.',
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.textMuted,
            height: 1.9,
          ),
        ),
      ],
    );
  }
}
class _ProjectMetaCard extends StatelessWidget {
  const _ProjectMetaCard();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF031740),
        borderRadius: BorderRadius.circular(32),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'بيانات المشروع',
            style: textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 24),
          ..._metaItems.map(
                (item) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _MetaRow(item: item),
            ),
          ),
        ],
      ),
    );
  }
}
class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.item});
  final _MetaItem item;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(item.icon, color: AppColors.primary, size: 22),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.value,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class _ChallengeAndSolutionSection extends StatelessWidget {
  const _ChallengeAndSolutionSection();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1150),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;
              final children = [
                Expanded(
                  child: _TextCard(
                    title: 'التحدي',
                    description:
                    'طُلب منا تحويل هيكل خرساني قائم إلى محور أعمال يجمع بين الشركات الناشئة والجهات المؤسسية. كان التحدي الرئيس هو الحفاظ على البنية القائمة مع رفع الكفاءة الطاقية بنسبة 40% واستيعاب تدفق يومي يتجاوز ستة آلاف زائر.',
                  ),
                ),
                const SizedBox(width: 24, height: 24),
                Expanded(
                  child: _TextCard(
                    title: 'الحل',
                    description:
                    'اعتمدنا نهجاً مرحلياً يبدأ بتهيئة البنية التحتية الذكية، ثم توسيع المساحات القابلة للتخصيص، وأخيراً ربطها بمنصة مراقبة رقمية تصدر تقارير فورية عن الأداء التشغيلي.',
                  ),
                ),
              ];
              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  children[0],
                  const SizedBox(height: 24),
                  children[2],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
class _TextCard extends StatelessWidget {
  const _TextCard({required this.title, required this.description});
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textMuted,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}
class _ScopeOfWorkSection extends StatelessWidget {
  const _ScopeOfWorkSection();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'نطاق الأعمال',
                style: textTheme.headlineMedium?.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'خطوات تنفيذية واضحة تغطي جميع مراحل التصميم، التنفيذ، والتشغيل لضمان تجربة متكاملة للمستأجرين والزوار.',
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.textMuted,
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: _scopeSteps
                    .map((step) => SizedBox(
                  width: 260,
                  child: _ScopeStepCard(step: step),
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _ScopeStepCard extends StatelessWidget {
  const _ScopeStepCard({required this.step});
  final _ScopeStep step;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              step.number,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            step.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            step.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textMuted,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
class _ResultSection extends StatelessWidget {
  const _ResultSection();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 950),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'النتيجة النهائية',
                  style: textTheme.headlineSmall?.copyWith(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'تم تسليم مركز أعمال ينسجم مع متطلبات العلامات العالمية ويوفر بيئة مرنة تشجع على الانتاجية. حافظنا على الجدول الزمني، وخفضنا استهلاك الطاقة بنسبة 42% مقارنة بالتصميم القديم، كما حصد المشروع شهادة LEED الذهبية لأول مرة في المنطقة.',
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.textMuted,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class _TestimonialSection extends StatelessWidget {
  const _TestimonialSection();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 880),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: AppColors.border),
                  boxShadow: AppShadows.card,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ...List.generate(
                          5,
                              (index) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Icon(Icons.star, color: AppColors.primary, size: 22),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '5.0',
                          style: textTheme.titleLarge?.copyWith(
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'خدمة من الطراز الأول',
                      style: textTheme.headlineSmall?.copyWith(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'فريق المشروع كان شريكاً حقيقياً لنا؛ شاركونا الأرقام في كل مرحلة، وتفاعلوا بسرعة مع متطلبات المستأجرين الجدد، وأبقوا المساحات تعمل طوال فترة التطوير.',
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.textMuted,
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/images/i1.png'),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'جنى وائل',
                              style: textTheme.titleMedium?.copyWith(
                                color: AppColors.primaryDark,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'عميلة سعيدة',
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 24,
                left: 24,
                child: Icon(
                  Icons.format_quote,
                  size: 72,
                  color: AppColors.gray.withOpacity(0.15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _CallToActionBanner extends StatelessWidget {
  const _CallToActionBanner();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              gradient: const LinearGradient(
                colors: [Color(0xFF001A5F), Color(0xFF082B7C)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: CustomPaint(
              painter: DiagonalLinesPainter1(
                spacing: 18,
                color: Colors.white,
                thickness: 1,
                lineLength: 1,
                reverse: false,
                startOffset: 0,
                endOffset: 1,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 750;
                  final text = Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'تواصل معنا',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'خطط، ابنِ، ونجح — لنبدأ من اليوم!',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'مهندسونا جاهزون لصياغة تجربة خاصة بك مع جداول تنفيذ دقيقة وخيارات تمويل مرنة.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                            height: 1.7,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          child: const Text('اطلب استشارة'),
                        ),
                      ],
                    ),
                  );
                  final image = Image.asset(
                    'assets/images/eng1.png',
                    height: 220,
                    fit: BoxFit.contain,
                  );
                  if (isWide) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        text,
                        const SizedBox(width: 24),
                        image,
                      ],
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text,
                      const SizedBox(height: 24),
                      Center(child: image),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class _SolutionHighlightsSection extends StatelessWidget {
  const _SolutionHighlightsSection();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'تفاصيل الحل',
                style: textTheme.headlineMedium?.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'حلول عملية تعزز راحة المستخدم وتبقي بيئة العمل فعّالة طول الوقت.',
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 24,
                runSpacing: 16,
                children: _solutionPoints
                    .map(
                      (point) => SizedBox(
                    width: 280,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle, color: AppColors.primary, size: 22),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            point,
                            style: textTheme.bodyLarge?.copyWith(
                              color: AppColors.textMuted,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _GallerySection extends StatelessWidget {
  const _GallerySection();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;
              final images = [
                _GalleryImage(
                  imagePath: 'assets/images/p1.png',
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(48),
                    bottomRight: Radius.circular(48),
                  ),
                ),
                _GalleryImage(
                  imagePath: 'assets/images/p.jpg',
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(48),
                    bottomLeft: Radius.circular(48),
                  ),
                ),
              ];
              if (isWide) {
                return Row(
                  children: [
                    Expanded(child: images[0]),
                    const SizedBox(width: 24),
                    Expanded(child: images[1]),
                  ],
                );
              }
              return Column(
                children: [
                  images[0],
                  const SizedBox(height: 24),
                  images[1],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
class _GalleryImage extends StatelessWidget {
  const _GalleryImage({required this.imagePath, required this.borderRadius});
  final String imagePath;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
class _OtherProjectsSection extends StatelessWidget {
  const _OtherProjectsSection();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 38,
                    height: 2,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'مشاريع أخرى',
                    style: textTheme.labelLarge?.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'استكشف مشاريع مشابهة',
                style: textTheme.headlineMedium?.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 900;
                  final cards = _otherProjects
                      .map((project) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: _ProjectCard(project: project),
                    ),
                  ))
                      .toList();
                  if (isWide) {
                    return Row(children: cards);
                  }
                  return Column(
                    children: cards
                        .map((card) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: card,
                    ))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});
  final _OtherProject project;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.border),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(project.imagePath, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _TagChip(label: project.timeline),
              _TagChip(label: project.category),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            project.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.primaryDark,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
class _MetaItem {
  const _MetaItem({required this.label, required this.value, required this.icon});
  final String label;
  final String value;
  final IconData icon;
}
class _ScopeStep {
  const _ScopeStep({required this.number, required this.title, required this.description});
  final String number;
  final String title;
  final String description;
}
class _OtherProject {
  const _OtherProject({
    required this.title,
    required this.timeline,
    required this.category,
    required this.imagePath,
  });
  final String title;
  final String timeline;
  final String category;
  final String imagePath;
}
const List<_MetaItem> _metaItems = [
  _MetaItem(
    label: 'تصنيف المشروع',
    value: 'تطوير تجاري متكامل',
    icon: Icons.layers,
  ),
  _MetaItem(
    label: 'الموقع',
    value: 'واجهة الخليج - الرياض، السعودية',
    icon: Icons.location_on,
  ),
  _MetaItem(
    label: 'المساحة الإجمالية',
    value: '18,000 متر مربع',
    icon: Icons.square_foot,
  ),
  _MetaItem(
    label: 'مدة التنفيذ',
    value: '5 سنوات و3 أشهر',
    icon: Icons.access_time,
  ),
];
const List<_ScopeStep> _scopeSteps = [
  _ScopeStep(
    number: '01',
    title: 'التصميم والتخطيط',
    description: 'صياغة مخطط معماري مرن مع نماذج رقمية قابلة للتعديل لكل طابق.',
  ),
  _ScopeStep(
    number: '02',
    title: 'الهيكل والأعمال المدنية',
    description: 'تقوية الأعمدة القائمة وإضافة قلب خرساني جديد لنواقل الحركة الرأسية.',
  ),
  _ScopeStep(
    number: '03',
    title: 'الأنظمة الكهربائية والميكانيكية',
    description: 'دمج حساسات إنارة ذكية وأنظمة هواء متغيرة التدفق تقلل الهدر.',
  ),
  _ScopeStep(
    number: '04',
    title: 'التشطيبات الداخلية والخارجية',
    description: 'استخدام واجهات زجاجية مزدوجة مع خشب طبيعي يقاوم التغيرات المناخية.',
  ),
];
const List<String> _solutionPoints = [
  'تخصيص مصاعد سريعة لزوار الطوابق العلوية لتقليل زمن الانتظار.',
  'منظومة دخول رقمية تعتمد على رموز مؤقتة للضيوف وشارات ذكية للموظفين.',
  'غرف اجتماعات قابلة للدمج تتسع حتى 120 شخصاً مع تجهيزات بث مباشر.',
  'ممرات تهوية طبيعية تحافظ على درجة الرطوبة ضمن النطاق الصحي.',
  'مساحات استراحة بإطلالات خضراء موزعة على مستويات متعددة.',
  'لوحات قيادة تعرض استهلاك الطاقة والمياه في الوقت الفعلي.',
];
const List<_OtherProject> _otherProjects = [
  _OtherProject(
    title: 'برج الارتقاء',
    timeline: '2022 - 2025',
    category: 'تطوير تجاري',
    imagePath: 'assets/images/p1.png',
  ),
  _OtherProject(
    title: 'برج العاصمة',
    timeline: '2023 - 2026',
    category: 'مجمع أعمال',
    imagePath: 'assets/images/i.png',
  ),
];
// class _CallToActionBanner extends StatelessWidget {
//   const _CallToActionBanner();
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1100),
//           child: Container(
//             padding: const EdgeInsets.all(32),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(36),
//               gradient: const LinearGradient(
//                 colors: [Color(0xFF001A5F), Color(0xFF082B7C)],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//             ),
//             child: CustomPaint(
//               painter: DiagonalLinesPainter1(
//                 spacing: 18,
//                 color: Colors.white,
//                 thickness: 1,
//                 lineLength: 1,
//                 reverse: false,
//                 startOffset: 0,
//                 endOffset: 1,
//               ),
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   final isWide = constraints.maxWidth > 750;
//                   final text = Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'تواصل معنا',
//                           style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                                 color: Colors.white.withOpacity(0.8),
//                                 fontWeight: FontWeight.w600,
//                               ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'خطط، ابنِ، ونجح — لنبدأ من اليوم!',
//                           style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w800,
//                               ),
//                         ),
//                         const SizedBox(height: 12),
//                         Text(
//                           'مهندسونا جاهزون لصياغة تجربة خاصة بك مع جداول تنفيذ دقيقة وخيارات تمويل مرنة.',
//                           style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                                 color: Colors.white.withOpacity(0.9),
//                                 height: 1.7,
//                               ),
//                         ),
//                         const SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.primary,
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                           ),
//                           child: const Text('اطلب استشارة'),
//                         ),
//                       ],
//                     ),
//                   );
//                   final image = Image.asset(
//                     'assets/images/eng1.png',
//                     height: 220,
//                     fit: BoxFit.contain,
//                   );
//                   if (isWide) {
//                     return Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         text,
//                         const SizedBox(width: 24),
//                         image,
//                       ],
//                     );
//                   }
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       text,
//                       const SizedBox(height: 24),
//                       Center(child: image),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class _SolutionHighlightsSection extends StatelessWidget {
//   const _SolutionHighlightsSection();
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1000),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'تفاصيل الحل',
//                 style: textTheme.headlineMedium?.copyWith(
//                   color: AppColors.primaryDark,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 'حلول عملية تعزز راحة المستخدم وتبقي بيئة العمل فعّالة طول الوقت.',
//                 style: textTheme.bodyLarge?.copyWith(
//                   color: AppColors.textMuted,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Wrap(
//                 spacing: 24,
//                 runSpacing: 16,
//                 children: _solutionPoints
//                     .map(
//                       (point) => SizedBox(
//                         width: 280,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Icon(Icons.check_circle, color: AppColors.primary, size: 22),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Text(
//                                 point,
//                                 style: textTheme.bodyLarge?.copyWith(
//                                   color: AppColors.textMuted,
//                                   height: 1.6,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                     .toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class _GallerySection extends StatelessWidget {
//   const _GallerySection();
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1100),
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               final isWide = constraints.maxWidth > 900;
//               final images = [
//                 _GalleryImage(
//                   imagePath: 'assets/images/p1.png',
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(48),
//                     bottomRight: Radius.circular(48),
//                   ),
//                 ),
//                 _GalleryImage(
//                   imagePath: 'assets/images/p.jpg',
//                   borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(48),
//                     bottomLeft: Radius.circular(48),
//                   ),
//                 ),
//               ];
//               if (isWide) {
//                 return Row(
//                   children: [
//                     Expanded(child: images[0]),
//                     const SizedBox(width: 24),
//                     Expanded(child: images[1]),
//                   ],
//                 );
//               }
//               return Column(
//                 children: [
//                   images[0],
//                   const SizedBox(height: 24),
//                   images[1],
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
// class _GalleryImage extends StatelessWidget {
//   const _GalleryImage({required this.imagePath, required this.borderRadius});
//   final String imagePath;
//   final BorderRadius borderRadius;
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: borderRadius,
//       child: AspectRatio(
//         aspectRatio: 4 / 3,
//         child: Image.asset(
//           imagePath,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
// class _OtherProjectsSection extends StatelessWidget {
//   const _OtherProjectsSection();
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1150),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     width: 38,
//                     height: 2,
//                     color: AppColors.primary,
//                   ),
//                   const SizedBox(width: 12),
//                   Text(
//                     'مشاريع أخرى',
//                     style: textTheme.labelLarge?.copyWith(
//                       color: AppColors.textMuted,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 'استكشف مشاريع مشابهة',
//                 style: textTheme.headlineMedium?.copyWith(
//                   color: AppColors.primaryDark,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               LayoutBuilder(
//                 builder: (context, constraints) {
//                   final isWide = constraints.maxWidth > 900;
//                   final cards = _otherProjects
//                       .map((project) => Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: _ProjectCard(project: project),
//                     ),
//                   ))
//                       .toList();
//
//                   if (isWide) {
//                     return Row(children: cards);
//                   }
//
//                   return Column(
//                     children: cards
//                         .map((card) => Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                       child: card,
//                     ))
//                         .toList(),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _ProjectCard extends StatelessWidget {
//   const _ProjectCard({required this.project});
//
//   final _OtherProject project;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(32),
//         border: Border.all(color: AppColors.border),
//         boxShadow: AppShadows.card,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(24),
//             child: AspectRatio(
//               aspectRatio: 4 / 3,
//               child: Image.asset(project.imagePath, fit: BoxFit.cover),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Wrap(
//             spacing: 8,
//             runSpacing: 8,
//             children: [
//               _TagChip(label: project.timeline),
//               _TagChip(label: project.category),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             project.title,
//             style: Theme.of(context).textTheme.titleLarge?.copyWith(
//               color: AppColors.primaryDark,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Align(
//             alignment: AlignmentDirectional.centerStart,
//             child: Container(
//               width: 44,
//               height: 44,
//               decoration: const BoxDecoration(
//                 color: AppColors.primaryDark,
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.arrow_forward, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _TagChip extends StatelessWidget {
//   const _TagChip({required this.label});
//
//   final String label;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: AppColors.primary.withOpacity(0.15),
//         borderRadius: BorderRadius.circular(999),
//       ),
//       child: Text(
//         label,
//         style: Theme.of(context).textTheme.labelLarge?.copyWith(
//           color: AppColors.primary,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }
// }
//
// class _MetaItem {
//   const _MetaItem({required this.label, required this.value, required this.icon});
//
//   final String label;
//   final String value;
//   final IconData icon;
// }
//
// class _ScopeStep {
//   const _ScopeStep({required this.number, required this.title, required this.description});
//
//   final String number;
//   final String title;
//   final String description;
// }
//
// class _OtherProject {
//   const _OtherProject({
//     required this.title,
//     required this.timeline,
//     required this.category,
//     required this.imagePath,
//   });
//
//   final String title;
//   final String timeline;
//   final String category;
//   final String imagePath;
// }
//
// const List<_MetaItem> _metaItems = [
//   _MetaItem(
//     label: 'تصنيف المشروع',
//     value: 'تطوير تجاري متكامل',
//     icon: Icons.layers,
//   ),
//   _MetaItem(
//     label: 'الموقع',
//     value: 'واجهة الخليج - الرياض، السعودية',
//     icon: Icons.location_on,
//   ),
//   _MetaItem(
//     label: 'المساحة الإجمالية',
//     value: '18,000 متر مربع',
//     icon: Icons.square_foot,
//   ),
//   _MetaItem(
//     label: 'مدة التنفيذ',
//     value: '5 سنوات و3 أشهر',
//     icon: Icons.access_time,
//   ),
// ];
//
// const List<_ScopeStep> _scopeSteps = [
//   _ScopeStep(
//     number: '01',
//     title: 'التصميم والتخطيط',
//     description: 'صياغة مخطط معماري مرن مع نماذج رقمية قابلة للتعديل لكل طابق.',
//   ),
//   _ScopeStep(
//     number: '02',
//     title: 'الهيكل والأعمال المدنية',
//     description: 'تقوية الأعمدة القائمة وإضافة قلب خرساني جديد لنواقل الحركة الرأسية.',
//   ),
//   _ScopeStep(
//     number: '03',
//     title: 'الأنظمة الكهربائية والميكانيكية',
//     description: 'دمج حساسات إنارة ذكية وأنظمة هواء متغيرة التدفق تقلل الهدر.',
//   ),
//   _ScopeStep(
//     number: '04',
//     title: 'التشطيبات الداخلية والخارجية',
//     description: 'استخدام واجهات زجاجية مزدوجة مع خشب طبيعي يقاوم التغيرات المناخية.',
//   ),
// ];
//
// const List<String> _solutionPoints = [
//   'تخصيص مصاعد سريعة لزوار الطوابق العلوية لتقليل زمن الانتظار.',
//   'منظومة دخول رقمية تعتمد على رموز مؤقتة للضيوف وشارات ذكية للموظفين.',
//   'غرف اجتماعات قابلة للدمج تتسع حتى 120 شخصاً مع تجهيزات بث مباشر.',
//   'ممرات تهوية طبيعية تحافظ على درجة الرطوبة ضمن النطاق الصحي.',
//   'مساحات استراحة بإطلالات خضراء موزعة على مستويات متعددة.',
//   'لوحات قيادة تعرض استهلاك الطاقة والمياه في الوقت الفعلي.',
// ];
//
// const List<_OtherProject> _otherProjects = [
//   _OtherProject(
//     title: 'برج الارتقاء',
//     timeline: '2022 - 2025',
//     category: 'تطوير تجاري',
//     imagePath: 'assets/images/p1.png',
//   ),
//   _OtherProject(
//     title: 'برج العاصمة',
//     timeline: '2023 - 2026',
//     category: 'مجمع أعمال',
//     imagePath: 'assets/images/i.png',
//   ),
// ];
