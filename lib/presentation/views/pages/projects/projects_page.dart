import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/sections/home/header.dart';

import '../../widgets/graphics/clippers.dart';
import '../../widgets/graphics/unified_ruler_ticks_painter.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _ProjectsHero(),
            CustomPaint(
                foregroundPainter:  UnifiedRulerTicksPainter(
                  // أعلى أفقي
                  drawTop: true,
                  topMode: UnifiedRulerTicksMode.horizontal,
                  topStep: 10,
                  topPatternHeights: [14, 6, 10, 6, 14],
                  topMargin: 0,
                  topStrokeWidth: 1,
                  topColor: Color(0xFFD1D5DB),

                  // أسفل أفقي (نفس الإعدادات)
                  drawBottom: false,
                  bottomMode: UnifiedRulerTicksMode.horizontal,
                  bottomStep: 10,
                  bottomPatternHeights: [14, 6, 10, 6, 14],
                  bottomMargin: 0,
                  bottomStrokeWidth: 1,
                  bottomColor: Color(0xFFD1D5DB),
                ),
                child: _ProjectsBody()),
          ],
        ),
      ),
    );
  }
}

class _ProjectsHero extends StatelessWidget {
  const _ProjectsHero();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        CustomPaint(
    foregroundPainter:  UnifiedRulerTicksPainter(
      drawBottom: false,
    // أعلى أفقي
    drawTop: true,
      topMode: UnifiedRulerTicksMode.horizontal,
      topStep: 10,
      topPatternHeights: const [14, 6, 10, 6, 14],
      topMargin: 0,
      topStrokeWidth: 1,
      topColor: Color(0xFFD1D5DB),

    ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
            color: AppColors.bgG,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'المشاريع',
                      style: textTheme.displaySmall?.copyWith(
                        color: const Color(0xFF0A1E4D),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Home',
                          style: textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFF0A1E4D),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text('  /  '),
                        Text(
                          'Projects',
                          style: textTheme.bodyLarge?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 56,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF001E62), Color(0xFF0A2F78)],
                  ),
                ),
              ),
              CustomPaint(
                foregroundPainter:  UnifiedRulerTicksPainter(
                  drawTop: false,

                  // أسفل مائل
                  drawBottom: true,
                  bottomMode: UnifiedRulerTicksMode.diagonal,
                  bottomStep: 12,
                  bottomPatternHeights: const [20],
                  bottomAngleDeg: 60,
                  bottomDirection: DiagonalDirection.downLeft,
                  bottomMargin: 0,
                  bottomStrokeWidth: 1,
                  bottomColor: Color(0xFF5F83C8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProjectsBody extends StatelessWidget {
  const _ProjectsBody();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final headlineStyle = (textTheme.displaySmall ?? const TextStyle(fontSize: 40, fontWeight: FontWeight.w700))
        .copyWith(color: const Color(0xFF0A1E4D), fontWeight: FontWeight.w800);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 32, height: 2, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Text(
                    'المشاريع الأخيرة',
                    style: textTheme.titleMedium?.copyWith(
                      color: const Color(0xFF0A1E4D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  text: 'مشاريعنا ',
                  style: headlineStyle,
                  children: [
                    TextSpan(
                      text: 'المنجزة',
                      style: headlineStyle.copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              ...List.generate(
                _projects.length,
                (index) => _CompletedProjectCard(
                  clipper: TopCornerClipper(
      clipSize: 70,
          topRadius: 8,
          sideRadius: 8,
                    isRight: index.isOdd,
                    isLeft: index.isEven
      ),
                  project: _projects[index],
                  reversed: index.isOdd,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'عرض المزيد',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class _CompletedProjectCard extends StatelessWidget {
  final CompletedProject project;
  final bool reversed;
  final CustomClipper<Path>? clipper;

  const _CompletedProjectCard({required this.project, required this.reversed, this.clipper});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isHorizontal = constraints.maxWidth >= 900;
          if (isHorizontal) {
            final detail = Expanded(child: _ProjectDetails(project: project));
            final image = Expanded(child: _ProjectImage(project: project,clipper:clipper));
            final spacer = const SizedBox(width: 32);
            final children = reversed
                ? [image, spacer, detail]
                : [detail, spacer, image];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            );
          }
          return Column(
            children: [
              _ProjectImage(project: project),
              const SizedBox(height: 24),
              _ProjectDetails(project: project),
            ],
          );
        },
      ),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  final CompletedProject project;

  const _ProjectDetails({required this.project});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Widget infoTile(IconData icon, String label, String value) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '$label : $value',
                style: textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF394360),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.title,
          style: textTheme.headlineMedium?.copyWith(
            color: const Color(0xFF0A1E4D),
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          project.description,
          style: textTheme.bodyLarge?.copyWith(
            color: const Color(0xFF6B7280),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        infoTile(Icons.location_on_outlined, 'موقع', project.location),
        infoTile(Icons.straighten_rounded, 'مساحة الاجمالية', project.area),
        infoTile(Icons.calendar_month_outlined, 'مدة', project.duration),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text(
                'المزيد',
                style: textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_right_alt_rounded,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProjectImage extends StatelessWidget {
  final CompletedProject project;
  final CustomClipper<Path>? clipper;

  const _ProjectImage({required this.project, this.clipper});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                project.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    color: const Color(0xFFE5E8F0),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Row(
                children: [
                  _TagChip(label: project.timeline),
                  const SizedBox(width: 8),
                  _TagChip(label: project.category),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: const Color(0xFF0A1E4D),
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class CompletedProject {
  final String title;
  final String description;
  final String location;
  final String area;
  final String duration;
  final String timeline;
  final String category;
  final String imageUrl;

  const CompletedProject({
    required this.title,
    required this.description,
    required this.location,
    required this.area,
    required this.duration,
    required this.timeline,
    required this.category,
    required this.imageUrl,
  });
}

const _projects = [
  CompletedProject(
    title: 'سكاي هافن',
    description:
    'مجمّع سكني حديث يدمج بين الكتل الزجاجية والشرفات العائمة لتعظيم الإطلالات البانورامية والاستفادة القصوى من ضوء الشمس الطبيعي.',
    location: 'الانشاءات، المكلا',
    area: '500 متر مربع',
    duration: 'سنة و2 شهر',
    timeline: '2024-2025',
    category: 'الإنشاءات السكنية',
    imageUrl:
    'https://images.unsplash.com/photo-1505691938895-1758d7feb511?auto=format&fit=crop&w=1200&q=80',
  ),

  CompletedProject(
    title: 'مركز الأعمال',
    description:
    'برج تجاري عالي الأداء مُصمَّم بواجهات مزوّدة بزخارف عمودية إيقاعية تعمل على تحسين الإضاءة الطبيعية والراحة الحرارية.',
    location: 'الشافعي، المكلا',
    area: '18,000 متر مربع',
    duration: '5 سنوات و3 أشهر',
    timeline: '2020-2025',
    category: 'الإنشاءات التجارية',
    imageUrl:
    'https://images.unsplash.com/photo-1479839672679-a46483c0e7c8?auto=format&fit=crop&w=1200&q=80',
  ),

  CompletedProject(
    title: 'مركز الابتكار البحري',
    description:
    'منشأة أبحاث وتطوير مطلّة على المرسى، تضم مساحات عمل تعاونية ومختبرات استدامة ومساحات مرنة متعددة الاستخدامات.',
    location: 'ربوة المهندسين، المكلا',
    area: '9,500 متر مربع',
    duration: 'سنتان و6 أشهر',
    timeline: '2022-2024',
    category: 'حرم الابتكار',
    imageUrl:
    'https://images.unsplash.com/photo-1469474968028-56623f02e42e?auto=format&fit=crop&w=1200&q=80',
  ),

];


