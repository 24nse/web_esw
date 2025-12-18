import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/domain/entities/team_member.dart';
import 'package:web_site/presentation/views/pages/team_details/team_details_page.dart';
import 'package:web_site/presentation/views/widgets/graphics/clippers.dart';
import 'package:web_site/presentation/views/widgets/graphics/unified_ruler_ticks_painter.dart';

class TeamMemberCard extends StatefulWidget {
  final TeamMember member;

  const TeamMemberCard({
    super.key,
    required this.member,
  });

  @override
  State<TeamMemberCard> createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<TeamMemberCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeamDetailsPage(memberId: widget.member.id),
            ),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Orange shape under card on hover
            Positioned(
              bottom: _isHovered ? -6 : -3,
              left: 1,
              right: 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            // Main Card
            ClipPath(
              clipper: TopCornerClipper(
                clipSize: 70,
                topRadius: 8,
                sideRadius: 8,
                isRight: true,
              ),
              child: Container(
                width: 280, // Adjusted width
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                      child: CustomPaint(
                        foregroundPainter: UnifiedRulerTicksPainter(
                          isVertical: true,
                          drawTop: true,
                          topMode: UnifiedRulerTicksMode.diagonal,
                          topStep: 12,
                          topPatternHeights: const [12],
                          topMargin: 0,
                          topStrokeWidth: 0.5,
                          topColor: const Color(0xFF5F83C8),
                          topAngleDeg: 60,
                          topDirection: DiagonalDirection.downRight,
                          drawBottom: true,
                          bottomMode: UnifiedRulerTicksMode.horizontal,
                          bottomStep: 10,
                          bottomPatternHeights: const [14, 6, 10, 6, 14],
                          bottomMargin: 0,
                          bottomStrokeWidth: 0.5,
                          bottomColor: const Color(0xFFD1D5DB),
                        ),
                        child: Container(
                          height: 220, // Adjusted height
                          width: double.infinity,
                          color: const Color(0xFFE5E7EB),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(color: AppColors.bgG),
                                    ),
                                    Expanded(
                                      child: Container(color: const Color(0xFF01165a)),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: -100, // Adjusted position
                                left: 17, // Center image roughly
                                right: 17,
                                child: SizedBox(
                                  height: 320,
                                  child: Image.asset(
                                    widget.member.imageUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        "assets/images/eng1.png", // Fallback
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Content
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.member.name,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0A1E4D),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.member.title,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              _buildSocialIcon(Icons.facebook),
                              const SizedBox(width: 5),
                              _buildSocialIcon(Icons.email),
                              const SizedBox(width: 5),
                              _buildSocialIcon(Icons.link),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: AppColors.gray,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 12,
      ),
    );
  }
}
