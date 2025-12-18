import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import '../../widgets/buttons/play_button.dart';
import '../../widgets/common/title_section.dart';

/// A section that showcases a video with statistics overlay
/// Design based on the "Watch How We Bring Plans to Life" UI pattern
class VideoShowcaseSection extends StatelessWidget {
  const VideoShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          // Header Section
          TitleSection(
            title: 'شاهد الفيديو',
            des1: 'شاهد كيف نحول\n',
            des2: 'الخطط إلى واقع',
          ),          const SizedBox(height: 40),
          // Video Card with Statistics
          _buildVideoCard(context),
        ],
      ),
    );
  }


  /// Builds the video card with image, play button and statistics bar
  Widget _buildVideoCard(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Main Image Container
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Background Image
                  AspectRatio(
                    aspectRatio: 16 / 10,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.grey[300]!,
                            Colors.grey[400]!,
                          ],
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/c.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.primaryDark.withOpacity(0.1),
                            child: const Center(
                              child: Icon(
                                Icons.construction,
                                size: 80,
                                color: AppColors.primaryDark,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Play Button Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Centered Play Button
                  const Positioned.fill(
                    child: Center(
                      child: PlayButton(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Statistics Bar
          Positioned(
            left: 16,
            right: 16,
            bottom: -30,
            child: _buildStatisticsBar(),
          ),
        ],
      ),
    );
  }

  /// Builds the statistics bar with 4 stats
  Widget _buildStatisticsBar() {
    final List<StatItem> stats = [
      StatItem(value: '640+', label: 'Projects Completed'),
      StatItem(value: '25+', label: 'Years of Experience'),
      StatItem(value: '450+', label: 'Happy Customers'),
      StatItem(value: '120+', label: 'Skilled Professionals'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive: use column layout for smaller widths
          if (constraints.maxWidth < 500) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _buildStatItemWidget(stats[0])),
                    _buildVerticalDivider(),
                    Expanded(child: _buildStatItemWidget(stats[1])),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildStatItemWidget(stats[2])),
                    _buildVerticalDivider(),
                    Expanded(child: _buildStatItemWidget(stats[3])),
                  ],
                ),
              ],
            );
          }
          // Desktop layout
          return IntrinsicHeight(
            child: Row(
              children: [
                for (int i = 0; i < stats.length; i++) ...[
                  Expanded(child: _buildStatItemWidget(stats[i])),
                  if (i < stats.length - 1) _buildVerticalDivider(),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  /// Builds individual stat item widget
  Widget _buildStatItemWidget(StatItem stat) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          stat.value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          stat.label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.75),
            letterSpacing: 0.2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Builds the vertical divider between stats
  Widget _buildVerticalDivider() {
    return Container(
      width: 1,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.white.withOpacity(0.2),
    );
  }
}

/// Model class for statistics items
class StatItem {
  final String value;
  final String label;

  const StatItem({
    required this.value,
    required this.label,
  });
}
